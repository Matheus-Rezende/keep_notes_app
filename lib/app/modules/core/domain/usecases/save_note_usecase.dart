// domain/usecases/save_note_usecase.dart
import '../entities/note_entity.dart';
import '../repositories/note_repository.dart';

class SaveNoteUseCase {
  final NoteRepository repository;

  SaveNoteUseCase(this.repository);

  Future<void> call(NoteEntity note) => repository.saveNote(note);
}
