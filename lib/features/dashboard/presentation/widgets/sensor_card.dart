import 'package:flutter/material.dart';

class SensorCard extends StatelessWidget {
  const SensorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 260,
          height: 288,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x0F000000),
                blurRadius: 3,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                left: 16,
                top: 48,
                child: Container(
                  width: 225.59,
                  height: 25,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFFF2F4F6),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 37.50,
                    children: [
                      Container(
                        width: 120.09,
                        height: 16,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Text(
                              '25.11.2025 - 10:05:50',
                              style: TextStyle(
                                color: const Color(0xFF495565),
                                fontSize: 12,
                                fontFamily: 'Gilroy-Medium',
                                fontWeight: FontWeight.w400,
                                height: 1.33,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 68,
                        height: 16,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
                            ),
                            Container(
                              width: 16,
                              height: 16,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
                            ),
                            Expanded(
                              child: Container(
                                height: 12,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF00C950),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 98,
                top: 103,
                child: Container(width: 76, height: 141),
              ),
              Positioned(
                left: 89,
                top: 114,
                child: Container(
                  width: 80,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 7,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(11),
                        decoration: ShapeDecoration(
                          color: const Color(0xFF15803D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.80),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 11,
                          children: [
                            Container(
                              width: 39.60,
                              height: 39.60,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 11,
                                children: [],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Sıcaklık',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF354152),
                          fontSize: 17.60,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                          height: 1.13,
                        ),
                      ),
                      Container(
                        width: 86,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 6,
                          children: [
                            Text(
                              '24',
                              style: TextStyle(
                                color: const Color(0xFF15803D),
                                fontSize: 48,
                                fontFamily: 'Gilroy-Bold',
                                fontWeight: FontWeight.w400,
                                height: 0.88,
                              ),
                            ),
                            Text(
                              '°C',
                              style: TextStyle(
                                color: const Color(0xFF15803D),
                                fontSize: 24,
                                fontFamily: 'Gilroy-Bold',
                                fontWeight: FontWeight.w400,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 257.59,
                  height: 52,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Stack(
                    children: [
                      Container(
                        width: 90.27,
                        height: 24,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
                            ),
                            Expanded(
                              child: Container(
                                height: 24,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 2,
                                      top: -1,
                                      child: Text(
                                        'DSO 140',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: const Color(0xFF0A0A0A),
                                          fontSize: 16,
                                          fontFamily: 'Gilroy-SemiBold',
                                          fontWeight: FontWeight.w400,
                                          height: 1.50,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Opacity(
                        opacity: 0,
                        child: Container(
                          width: 28,
                          height: 28,
                          padding:
                              const EdgeInsets.only(top: 6, left: 6, right: 6),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 16,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Stack(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 214,
                        top: 10,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  spacing: 2,
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 4,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        spacing: 2,
                                        children: [
                                          Container(
                                            width: 4,
                                            height: 4,
                                            decoration: ShapeDecoration(
                                              color: const Color(0xFF99A1AF),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16777200),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 4,
                                              decoration: ShapeDecoration(
                                                color: const Color(0xFF99A1AF),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16777200),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 10,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          spacing: 2,
                                          children: [
                                            Container(
                                              width: 4,
                                              height: 4,
                                              decoration: ShapeDecoration(
                                                color: const Color(0xFF99A1AF),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16777200),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 4,
                                                decoration: ShapeDecoration(
                                                  color:
                                                      const Color(0xFF99A1AF),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16777200),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
