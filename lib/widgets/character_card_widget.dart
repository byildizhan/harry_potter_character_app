import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_calismasi/model/character_model.dart';
import 'package:flutter_test_calismasi/widgets/info_row_widget.dart';

class CharacterDetailWidget extends StatelessWidget {
  final CharacterModel characterData;

  const CharacterDetailWidget({super.key, required this.characterData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Karakterin adı ve resmi
              Center(
                child: ClipOval(
                  child: characterData.image.isNotEmpty
                      ? Image.network(
                          characterData.image,
                          width: 100,
                          height: 100,
                          fit: BoxFit
                              .cover, // Resmin nasıl yerleştirileceğini belirler
                        )
                      : const Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.grey,
                        ), // Profil ikonu
                ),
              ),
              const SizedBox(height: 20),
              Text(
                characterData.name,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              10.verticalSpace,
              infoRowWidget('Actor',
                  characterData.actor == '' ? 'No Data' : characterData.actor),
              infoRowWidget('House',
                  characterData.house == '' ? 'No Data' : characterData.house),
              infoRowWidget('Gender', characterData.gender),
              infoRowWidget(
                  'Species',
                  characterData.species == ''
                      ? 'No Data'
                      : characterData.species),
              infoRowWidget(
                  'Born', '${characterData.yearOfBirth ?? 'No Data'}'),
              infoRowWidget(
                  'Patronus',
                  characterData.patronus == ''
                      ? 'No Data'
                      : characterData.patronus),
              infoRowWidget('Wizard', characterData.wizard ? 'Yes' : 'No'),
              infoRowWidget('Alive', characterData.alive ? 'Yes' : 'No'),
            ],
          ),
        ),
      ),
    );
  }
}
