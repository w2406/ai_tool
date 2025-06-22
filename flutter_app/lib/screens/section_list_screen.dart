import 'package:flutter/material.dart';

class SectionListScreen extends StatelessWidget {
  const SectionListScreen({super.key});

  final List<Map<String, dynamic>> sections = const [
    {
      'title': 'Dartの基礎',
      'description': 'Dartプログラミング言語の基本的な概念と構文を学習します。',
      'progress': 0.8,
      'color': Colors.blue,
    },
    {
      'title': '開発環境とツール',
      'description': 'Flutter開発に必要なツールと環境設定について学習します。',
      'progress': 0.6,
      'color': Colors.green,
    },
    {
      'title': 'Flutterウィジェットの基本',
      'description': 'Flutter UI構築の根幹であるウィジェットについて学習します。',
      'progress': 0.3,
      'color': Colors.orange,
    },
    {
      'title': 'アセットの利用',
      'description': '画像やフォントなどの静的ファイルをアプリケーションで利用する方法を学習します。',
      'progress': 0.0,
      'color': Colors.purple,
    },
    {
      'title': 'バージョン管理システム',
      'description': 'ソースコードの変更履歴を管理するシステムについて学習します。',
      'progress': 0.0,
      'color': Colors.red,
    },
    {
      'title': 'リポジトリホスティングサービス',
      'description': 'Gitリポジトリをホストし、チーム開発を効率化するためのサービスについて学習します。',
      'progress': 0.0,
      'color': Colors.teal,
    },
    {
      'title': '設計原則',
      'description': 'ソフトウェアの保守性や拡張性を高めるための基本的な設計指針を学習します。',
      'progress': 0.0,
      'color': Colors.indigo,
    },
    {
      'title': 'パッケージ管理',
      'description': '外部ライブラリや依存関係を管理するツールについて学習します。',
      'progress': 0.0,
      'color': Colors.brown,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'セクション一覧',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF1976D2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final section = sections[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _buildSectionCard(
              title: section['title'],
              description: section['description'],
              progress: section['progress'],
              color: section['color'],
              onTap: () {
                // セクション詳細画面への遷移
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required String description,
    required double progress,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333333),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (progress > 0)
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 16,
                      ),
                    ),
                ],
              ),
              if (progress > 0) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(color),
                        minHeight: 6,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
