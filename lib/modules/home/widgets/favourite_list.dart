import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trading_app/models/live_data_model.dart';
import 'package:trading_app/modules/home/bloc/live_data_bloc.dart';
import 'package:trading_app/modules/home/services/watchlist_data.dart';
import 'package:trading_app/modules/home/widgets/watchlist_tile.dart';
import 'package:trading_app/utils/global_constants.dart';

class FavouriteList extends StatefulWidget {
  const FavouriteList({super.key});

  @override
  State<FavouriteList> createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<LiveDataBloc>(context).add(LiveDataConnected());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 17.76),
          height: 41,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Script',
                style: GoogleFonts.amaranth(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: GlobalConstants.hintColor,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Bid',
                    style: GoogleFonts.amaranth(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: GlobalConstants.hintColor,
                    ),
                  ),
                  const SizedBox(width: 90),
                  Text(
                    'Ask',
                    style: GoogleFonts.amaranth(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: GlobalConstants.hintColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child:  BlocBuilder<LiveDataBloc, LiveDataState>(
            builder: (context, state) {
              if (state is LiveDataReceivedState) {
                return StreamBuilder(
                  stream: state.data.stream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<LiveData> liveDataList = List.empty(growable: true);
                      Map<String, dynamic> data = snapshot.data;
                      data.forEach((key, value) {
                        liveDataList.add(LiveData(id: key, title: key, bid: value['bid'].toString(), ask: value['ask'].toString()));
                      });
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return WatchlistTile(
                            liveData: liveDataList[index],
                            onDelete:() {
                              watchlistData.removeAt(index);
                              setState(() {});
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Item removed from favourites'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                          );
                        },
                      );
                    }
                    return const SizedBox();
                  },
                );
              }
              return Text(state.toString());
            },
          ),
        ),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: watchlistData.length,
        //     itemBuilder: (context, index) {
        //       return WatchlistTile(watchlist: watchlistData[index], onDelete: () {
        //         watchlistData.removeAt(index);
        //         setState(() {});
        //         ScaffoldMessenger.of(context).showSnackBar(
        //           const SnackBar(
        //             content: Text('Item removed from favourites'),
        //             duration: Duration(seconds: 2),
        //           ),
        //         );
        //       },);
        //     },
        //   ),
        // ),
      ],
    );
  }
}
