import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:route_event_task/domain/model/Product.dart';
import 'package:route_event_task/ui/constans/constans.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;

  ProductWidget({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double discountedPrice =
        product.price! - ((product.discountPercentage! / 100) * product.price!);

    return Container(
      height: 237,
      width: 191,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(
          width: 2,
          color: AppConstans.mainColor.withOpacity(0.5),
        ),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                child: CachedNetworkImage(
                  imageUrl: product.thumbnail ?? '',
                  fit: BoxFit.fill,
                  height: 128,
                  width: 191,
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                    color: AppConstans.mainColor,
                  )),
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(Icons.error)),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: AppConstans.mainColor,
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${product.title ?? ''}',
                    style: AppConstans.titleStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        'EGP ${discountedPrice.toStringAsFixed(2)}',
                        // Display discounted price
                        style: AppConstans.priceStyle,
                      ),
                      SizedBox(width: 10),
                      Visibility(
                        visible: product.discountPercentage != null &&
                            product.discountPercentage! > 0,
                        child: Text('${product.price!.toStringAsFixed(2)}',
                            // Display original price with strikethrough
                            style: AppConstans.DisPriceStyle),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Reviews (${product.rating?.toString() ?? ''})',
                              style: AppConstans.reviewStyle),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppConstans.mainColor,
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
