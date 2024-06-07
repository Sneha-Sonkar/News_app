import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {
  bool isDark = false;
  String selectedLanguage = 'English';  // Default selected language

  // Define translations for each text in different languages
  final Map<String, Map<String, String>> translations = {
    'English': {
      'title': 'Settings',
      'selectTheme': 'Select Theme',
      'selectLanguage': 'Select Language',
    },
    'Spanish': {
      'title': 'Configuración',
      'selectTheme': 'Seleccionar tema',
      'selectLanguage': 'Seleccionar idioma',
    },
    'French': {
      'title': 'Paramètres',
      'selectTheme': 'Choisir un thème',
      'selectLanguage': 'Choisir une langue',
    },
    'German': {
      'title': 'Einstellungen',
      'selectTheme': 'Thema auswählen',
      'selectLanguage': 'Sprache auswählen',
    },
    'Chinese': {
      'title': '设置',
      'selectTheme': '选择主题',
      'selectLanguage': '选择语言',
    },
  };

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
    );

    // Get the current translations
    final currentTranslations = translations[selectedLanguage]!;

    return MaterialApp(
      theme: themeData,
      home: Scaffold(
        appBar: AppBar(
          title: Text(currentTranslations['title']!),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,  // Minimize the height of the Column to its children
            crossAxisAlignment: CrossAxisAlignment.center,  // Center horizontally
            mainAxisAlignment: MainAxisAlignment.center,  // Center vertically
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    currentTranslations['selectTheme']!,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 8),
                  Tooltip(
                    message: 'Change Brightness mode',
                    child: IconButton(
                      icon: const Icon(Icons.brightness_6),
                      onPressed: () {
                        setState(() {
                          isDark = !isDark;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    currentTranslations['selectLanguage']!,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: selectedLanguage,
                    items: translations.keys.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLanguage = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
