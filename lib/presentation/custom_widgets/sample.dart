//
import 'package:flutter/material.dart';

final List<String> exampleList = [
  '数学',
  '国語',
  '化学',
  '物理',
  '生物',
  '家庭科',
  '体育',
  '英語',
  '歴史',
  '地理',
  '公民',
  '美術',
  '音楽',
  '中国語',
  'フランス語'
];

final a = exampleList
    .map((e) => Card(
          child: Center(
            child: Text(e),
          ),
        ))
    .toList();

//
