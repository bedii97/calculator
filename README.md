# Calculator

Calculator is a simple mobile calculator app built with Flutter. It evaluates mathematical expressions using the [math_expressions](https://pub.dev/packages/math_expressions) package and stores calculation history locally with [Hive](https://pub.dev/packages/hive).

## Features

- **Mathematical Expression Evaluation:**  
  Uses the math_expressions package to parse and evaluate user-entered expressions.

- **Local History Persistence:**  
  Saves calculation history on the user’s device using Hive.

- **Clean Architecture:**  
  The project is organized into layers for maintainability and scalability:
  - **Core:** Contains shared constants and styling.
  - **Data:** Includes repositories for expression evaluation and history storage.
  - **Domain:** Hosts business logic (use cases) for evaluating expressions.
  - **Presentation:** Manages UI components such as pages and reusable widgets.

## Packages Used

- [math_expressions](https://pub.dev/packages/math_expressions)
- [Hive](https://pub.dev/packages/hive)
- [hive_flutter](https://pub.dev/packages/hive_flutter)

---

# Calculator

Calculator, Flutter ile geliştirilmiş basit bir mobil hesap makinesi uygulamasıdır. Kullanıcının girdiği matematiksel ifadeleri [math_expressions](https://pub.dev/packages/math_expressions) paketi ile çözer ve hesap geçmişini [Hive](https://pub.dev/packages/hive) kullanarak yerel olarak saklar.

## Özellikler

- **Matematiksel İfade Çözümü:**  
  Kullanıcının girdiği ifadeleri çözümlemek ve değerlendirmek için math_expressions paketi kullanılır.

- **Yerel Geçmiş Saklama:**  
  Hesaplamalar, Hive kullanılarak cihazda saklanır.

- **Clean Architecture:**  
  Proje, sürdürülebilirlik ve ölçeklenebilirlik için katmanlı bir yapıda düzenlenmiştir:
  - **Core:** Ortak sabitler ve stil tanımları içerir.
  - **Data:** İfade değerlendirme ve geçmiş saklama işlemleri için repository'ler içerir.
  - **Domain:** İfadeleri değerlendirmek için iş mantığı (use case) barındırır.
  - **Presentation:** Sayfalar ve yeniden kullanılabilir widget'lar gibi kullanıcı arayüzü bileşenlerini yönetir.

## Kullanılan Paketler

- [math_expressions](https://pub.dev/packages/math_expressions)
- [Hive](https://pub.dev/packages/hive)
- [hive_flutter](https://pub.dev/packages/hive_flutter)
