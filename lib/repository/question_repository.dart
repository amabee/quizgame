import 'package:quizgame/models/question_model.dart';

import 'db_repository.dart';

class QuestionRepository {
  Future createQuestionTable() async {
    final db = await DbRepository().database;
    String id = 'id INTEGER PRIMARY KEY AUTOINCREMENT';
    String category = 'category TEXT NOT NULL';
    String categoryId = 'categoryId INTEGER NOT NULL';
    String hasImage = 'hasImage BOOLEAN NOT NULL';
    String imageUri = 'imageUri TEXT NULL';
    String question = 'question TEXT NOT NULL';
    String answer = 'answer TEXT NOT NULL';
    String option1 = 'option1 TEXT NOT NULL';
    String option2 = 'option2 TEXT NOT NULL';
    String option3 = 'option3 TEXT NOT NULL';
    String option4 = 'option4 TEXT NOT NULL';
    String fKey =
        'CONSTRAINT fk_category FOREIGN KEY (categoryId) REFERENCES category (id)';
    String sqlQuestion =
        'CREATE TABLE IF NOT EXISTS question($id, $category, $categoryId, $hasImage, $imageUri, $question, $answer, $option1, $option2, $option3, $option4, $fKey)';
    await db.execute(sqlQuestion);

    final List<Map<String, dynamic>> maps =
        await db.rawQuery('select 1 from question limit 1');
    if (maps.isEmpty) {
      final List<QuestionModel> questionList = [
        // LEA
        QuestionModel(
            category: 'Criminal Law and Jurisprudence',
            categoryId: 1,
            hasImage: false,
            imageUri: '',
            question:
                'Mr. Wow has undergone preventive imprisonment for his crime. During which, he escaped from his place of confinement. He maybe ___.',
            answer: 'C. not liable for evasion of service of sentence',
            option1: 'A. liable for evasion of service of sentence',
            option2: 'B. considered as an escaped prisoner',
            option3: 'C. not liable for evasion of service of sentence',
            option4: 'D. All of these'),

        QuestionModel(
            category: 'Law Enforcement Administration',
            categoryId: 1,
            hasImage: false,
            imageUri: '',
            question:
                'Mr. Wow was convicted for the crime of Parricide. After his judgment becomes final and executory, he escaped from his place of confinement. He maybe ____.',
            answer: 'A. liable for evasion of service of sentence',
            option1: 'A. liable for evasion of service of sentence',
            option2: 'B. considered as an escaped prisoner',
            option3: 'C. not liable for evasion of service of sentence',
            option4: 'D. All of these'),
        QuestionModel(
            category: 'Forensics/Criminalistics',
            categoryId: 1,
            hasImage: false,
            imageUri: '',
            question:
                'Mr. Wow was convicted for the crime of Parricide. After his judgment becomes final and executory, he escaped from his place of confinement. He may be ____.',
            answer: 'A. liable for evasion of service of sentence',
            option1: 'A. liable for evasion of service of sentence',
            option2: 'B. considered as an escaped prisoner',
            option3: 'C. not liable for evasion of service of sentence',
            option4: 'D. All of these'),

        QuestionModel(
            category: 'Law Enforcement Administration',
            categoryId: 1,
            hasImage: false,
            imageUri: '',
            question:
                'The petitioner is not granted for Parole, after which he tried to apply to the President at least with conditions and serve his remaining sentence in free community. What investigation will be conducted by the Parole and Probation Administration?',
            answer: 'a. Pre-parole investigation',
            option1: 'a. Pre-parole investigation',
            option2: 'b. Pre-release progress investigation',
            option3: 'c. Pre-executive clemency investigation',
            option4: 'd. Post-sentence investigation'),

        QuestionModel(
            category: 'Law Enforcement Administration',
            categoryId: 1,
            hasImage: false,
            imageUri: '',
            question:
                'If the probationer fails to report within 72 hours upon receipt of the order of probation to the proper office, he is considered to be an absconding _____.',
            answer: 'b.	Applicant',
            option1: 'a. Probationer',
            option2: 'b. Applicant',
            option3: 'c. Probation',
            option4: 'd. Petitioner'),

        QuestionModel(
            category: 'Correctional Administration',
            categoryId: 1,
            hasImage: false,
            imageUri: '',
            question:
                'What program on Therapeutic Community that is an essential element in achieving high rates of sobriety and desistance from offending?',
            answer: 'c. aftercare',
            option1: 'a. rehabilitation',
            option2: 'b. deterrence',
            option3: 'c. aftercare',
            option4: 'd. community service'),

        QuestionModel(
            category: 'Law Enforcement Administration',
            categoryId: 1,
            hasImage: false,
            imageUri: '',
            question:
                'After conviction and sentence, Mr. XY applies for Probation instead of appealing his case. Where should he file such an application?',
            answer: 'd.	Trial Court',
            option1: 'a. Probation and Parole Administration',
            option2: 'b. MTC',
            option3: 'c. Court of Appeals',
            option4: 'd. Trial Court'),

        QuestionModel(
            category: 'Law Enforcement Administration',
            categoryId: 1,
            hasImage: false,
            imageUri: '',
            question:
                'It refers to the abatement of a prison sentence of a prisoner?',
            answer: 'b. Commutation of Sentence',
            option1: 'a. Pardon',
            option2: 'b. Commutation of Sentence',
            option3: 'c. Parole',
            option4: 'd. Reprieve'),

        QuestionModel(
            category: 'Sociology of Crimes and Ethics',
            categoryId: 1,
            hasImage: false,
            imageUri: '',
            question:
                'Mr. X was convicted for the crime of Robbery. After serving her sentence he committed again the same crime. Mr. X may be considered as a ___.',
            answer: 'A. recidivist',
            option1: 'A. recidivist',
            option2: 'B. quasi-recidivist',
            option3: 'C. habitual delinquent',
            option4: 'D. mentally retarded person'),

        QuestionModel(
            category: 'Law Enforcement Administration',
            categoryId: 1,
            hasImage: false,
            imageUri: '',
            question:
                'The Camp Sampaguita of the national Bilibid Prison houses what security prisoners?',
            answer: 'C. Medium ',
            option1: 'A. Super Maximum',
            option2: 'B. Maximum',
            option3: 'C. Medium',
            option4: 'D. Minimum'),

        QuestionModel(
            category: 'Crime Detection and Investigation',
            categoryId: 1,
            hasImage: false,
            imageUri: '',
            question:
                '______ is a broad range of community-based service supports designed to maintain benefit when the structured treatment has been completed.',
            answer: 'c. aftercare',
            option1: 'a. rehabilitation',
            option2: 'b. treatment',
            option3: 'c. aftercare',
            option4: 'd. community service'),
      ];

      await addQuestion(questionList);
    }
  }

  Future addQuestion(List<QuestionModel> questionList) async {
    final db = await DbRepository().database;

    for (QuestionModel x in questionList) {
      await db.insert('question', x.toMap());
    }
  }

  Future<List<Map<String, dynamic>>> loadQuestionByCategory(
      int categoryId) async {
    final db = await DbRepository().database;
    return await db.rawQuery(
        'select * from question where categoryId == ${categoryId.toString()}');
  }

  Future<List<Map<String, dynamic>>> loadQuestionByRandom() async {
    final db = await DbRepository().database;
    return await db
        .rawQuery('select * from question ORDER BY RANDOM() LIMIT 5');
  }
}
