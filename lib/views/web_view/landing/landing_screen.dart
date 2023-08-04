import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  Widget _buildBackgroundImageWidget(String imageUrl) {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                _buildBackgroundImageWidget(
                  AppStrings.landingBgImage1,
                ),
                Positioned(
                  top: 40,
                  left: 40,
                  child: Text(
                    'Nova',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.novaWhite,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Positioned(
                  top: 180,
                  left: 180,
                  child: SizedBox(
                    width: 360,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Social Network',
                          style: TextStyle(
                            fontSize: 48,
                            color: AppColors.novaWhite,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'for GenZ',
                          style: TextStyle(
                            fontSize: 48,
                            color: AppColors.novaWhite,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Shape your future and have fun doing it at Nova',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.novaWhite,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                _buildBackgroundImageWidget(
                  AppStrings.landingBgImage2,
                ),
                Positioned(
                  bottom: 200,
                  left: deviceSize.width * 0.2,
                  child: SizedBox(
                    width: deviceSize.width * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome to',
                          style: TextStyle(
                            fontSize: 48,
                            color: AppColors.novaWhite,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Novaverse',
                          style: TextStyle(
                            fontSize: 48,
                            color: AppColors.novaWhite,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        sizedBoxWithHeight(32),
                        Text(
                          'Novaverse is a place designed specifically for young professionals. '
                          'Connect with like-minded peers and build your professional network. '
                          'Join digital clubs, show off your accomplishments, and stand out from the crowd. '
                          'Plus, it\'s cool and fun.',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.novaWhite,
                            fontWeight: FontWeight.w800,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                _buildBackgroundImageWidget(
                  AppStrings.landingBgImage3,
                ),
                Positioned(
                  top: 180,
                  left: 180,
                  child: SizedBox(
                    width: 360,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Space Station',
                          style: TextStyle(
                            fontSize: 48,
                            color: AppColors.novaWhite,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Connect, learn and grow together with peers & mentors from all across the galaxy.',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.novaWhite,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                _buildBackgroundImageWidget(
                  AppStrings.landingBgImage4,
                ),
                Positioned(
                  top: 100,
                  left: deviceSize.width * 0.2,
                  child: SizedBox(
                    width: deviceSize.width * 0.6,
                    child: Center(
                      child: Text(
                        'Be a Super Nova',
                        style: TextStyle(
                          fontSize: 48,
                          color: AppColors.novaWhite,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Stack(
              children: [
                _buildBackgroundImageWidget(
                  AppStrings.landingBgImage5,
                ),
                Positioned(
                  top: 180,
                  left: 180,
                  child: SizedBox(
                    width: 380,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create your own',
                          style: TextStyle(
                            fontSize: 48,
                            color: AppColors.novaWhite,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Future',
                          style: TextStyle(
                            fontSize: 48,
                            color: AppColors.novaWhite,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
