// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:untitled17/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Uygulamanızın main.dart dosyasının yolunu buraya ekleyin

void main() {
  testWidgets('ChatApp test', (WidgetTester tester) async {
    // Uygulamayı başlatın
    await tester.pumpWidget(ChatApp());

    // Başlangıçta hiç mesaj olmadığını doğrulayın
    expect(find.byType(ListTile), findsNothing);

    // Metin kutusuna mesaj girin ve Gönder düğmesine tıklayın
    await tester.enterText(find.byType(TextField), 'Merhaba Dünya!');
    await tester.tap(find.text('Gönder'));
    await tester.pump();

    // Mesajın listeye eklenip eklenmediğini doğrulayın
    expect(find.byType(ListTile), findsOneWidget);
    expect(find.text('Merhaba Dünya!'), findsOneWidget);
    expect(find.text('Gönder'), findsNothing);

    // Yeni bir mesaj daha gönderin ve listeye eklenip eklenmediğini doğrulayın
    await tester.enterText(find.byType(TextField), 'Flutter çok güzel!');
    await tester.tap(find.text('Gönder'));
    await tester.pump();

    expect(find.byType(ListTile), findsNWidgets(2));
    expect(find.text('Flutter çok güzel!'), findsOneWidget);

    // Metin kutusuna boş bir mesaj girip Gönder düğmesine tıklamayın ve mesajın listeye eklenmediğini doğrulayın
    await tester.enterText(find.byType(TextField), '');
    await tester.tap(find.text('Gönder'));
    await tester.pump();

    expect(find.byType(ListTile), findsNWidgets(2));
    expect(find.text(''), findsNothing);
  });
}

