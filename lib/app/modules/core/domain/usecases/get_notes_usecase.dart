// domain/usecases/get_all_notes_usecase.dart
import '../entities/note_entity.dart';
import '../repositories/note_repository.dart';

class GetNotesUsecase {
  final NoteRepository repository;

  GetNotesUsecase(this.repository);

  Future<List<NoteEntity>> call() => repository.getNotes();
}
