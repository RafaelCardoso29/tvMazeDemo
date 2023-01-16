import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze_demo/core/models/episode_model.dart';
import 'package:tv_maze_demo/core/models/show_model.dart';
import 'package:tv_maze_demo/core/constants/app_colors.dart';
import 'package:tv_maze_demo/core/constants/app_styles.dart';
import 'package:tv_maze_demo/core/formatters/app_formatter.dart';
import 'package:tv_maze_demo/features/shows_details/presentation/cubit/shows_details_cubit.dart';
import 'package:tv_maze_demo/features/shows_details/presentation/widgets/episode_item.dart';
import 'package:tv_maze_demo/features/shows_details/presentation/widgets/subtitle_widget.dart';

class ShowsDetailsScreen extends StatefulWidget {
  const ShowsDetailsScreen({super.key});

  @override
  State<ShowsDetailsScreen> createState() => _ShowsDetailsScreenState();
}

class _ShowsDetailsScreenState extends State<ShowsDetailsScreen> {
  late ShowsDetailsCubit _cubit;
  late ScrollController _scrollController;
  Color _textColor = Colors.white;
  static const kExpandedHeight = 300.0;
  static const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 20.0);

  @override
  void initState() {
    _cubit = BlocProvider.of<ShowsDetailsCubit>(context);
    _cubit.getShow();
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _textColor = _isSliverAppBarExpanded
              ? AppColors.primary
              : AppColors.backgroundColor;
        });
      });
  }

  @override
  void dispose() {
    _cubit.close();
    _scrollController.dispose();
    super.dispose();
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowsDetailsCubit, ShowsDetailsState>(
      builder: ((context, state) {
        if (state is ShowsDetailsLoading) {
          return _buildLoadingState();
        } else if (state is ShowsDetailsSucesss) {
          return _buildSucessState(state);
        } else if (state is ShowsDetailsError) {
          return _buildErrorState(state);
        } else {
          return Container();
        }
      }),
    );
  }

  _buildLoadingState() {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
                height: 40,
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ))
          ],
        )));
  }

  Scaffold _buildErrorState(ShowsDetailsError state) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Text(state.error ?? "Unknown error",
              style: AppStyles.titleLarge(
                AppColors.primary,
              )),
        ));
  }

  _buildSucessState(ShowsDetailsSucesss state) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          _buildSliverAppBar(state.showModel),
          _buildContainer(10),
          _buildTitle(state.showModel.name ?? ""),
          _buildContainer(10),
          _buildGenres(state.showModel.genres ?? []),
          _buildContainer(40),
          const SubtitleWidget(subtitle: "About ", key: Key("About")),
          _buildContainer(10),
          _buildSummary(state.showModel.summary ?? ""),
          _buildContainer(40),
          const SubtitleWidget(subtitle: "Episodes ", key: Key("Episodes")),
          _buildContainer(10),
          _buildSliverEpisodeList(state.showModel.episodes ?? []),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(ShowModel showModel) {
    return SliverAppBar(
      backgroundColor: AppColors.backgroundColor,
      title: _isSliverAppBarExpanded
          ? Text(showModel.name ?? "",
              style: AppStyles.titleLarge(AppColors.primary))
          : null,
      pinned: true,
      snap: false,
      floating: false,
      centerTitle: true,
      elevation: 0,
      expandedHeight: kExpandedHeight,
      flexibleSpace: _isSliverAppBarExpanded
          ? null
          : FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                height: 200,
                color: Colors.black,
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.network(
                    showModel.image ?? "",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              background: Container(
                color: AppColors.backgroundColor,
              )),
    );
  }

  SliverPadding _buildGenres(List<String> list) {
    List<Widget> genreChips = [];
    for (var element in list) {
      genreChips.add(
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            element,
            style: AppStyles.labelMedium(
              AppColors.primary,
            ),
          ),
        ),
      );

      genreChips.add(const SizedBox(
        width: 10,
      ));
    }
    return SliverPadding(
        key: const Key("Genre"),
        padding: padding,
        sliver: SliverToBoxAdapter(
            child: Row(
          children: genreChips,
        )));
  }

  SliverToBoxAdapter _buildContainer(double? height) => SliverToBoxAdapter(
        child: SizedBox(height: height ?? 10),
      );

  SliverPadding _buildSummary(String summary) {
    return SliverPadding(
        key: const Key("5"),
        padding: padding,
        sliver: SliverToBoxAdapter(
            child: Row(
          children: [
            Expanded(
              child: Text(
                AppFormatter.toPlainText(summary),
                textAlign: TextAlign.start,
                style: AppStyles.bodyMedium(
                  AppColors.primary,
                ),
              ),
            ),
          ],
        )));
  }

  SliverPadding _buildTitle(String title) {
    return SliverPadding(
        padding: padding,
        sliver: SliverToBoxAdapter(
            child: Visibility(
          visible: !_isSliverAppBarExpanded,
          child: Row(
            children: [
              Expanded(
                child: Text(title,
                    textAlign: TextAlign.left,
                    style: AppStyles.titleLarge(
                      AppColors.primary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(height: 30),
            ],
          ),
        )));
  }

  SliverPadding _buildSliverEpisodeList(List<EpisodeModel> episodes) {
    return SliverPadding(
      key: const Key("list"),
      padding: padding,
      sliver: SliverVisibility(
        visible: episodes.isNotEmpty,
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: EpisodeItem(
                    context: context, episodeModel: episodes[index]),
              );
            },
            childCount: episodes.length,
          ),
        ),
      ),
    );
  }
}
