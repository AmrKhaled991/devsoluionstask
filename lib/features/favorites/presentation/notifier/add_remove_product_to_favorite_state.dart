// Fetching favorite markets

sealed class AddRemoveProductToFavoriteState {
  const AddRemoveProductToFavoriteState();
}

class AddRemoveProductToFavoriteInitial
    extends AddRemoveProductToFavoriteState {
  const AddRemoveProductToFavoriteInitial();

  @override
  List<Object?> get props => [];
}

class AddRemoveProductToFavoriteLoading
    extends AddRemoveProductToFavoriteState {
  const AddRemoveProductToFavoriteLoading();

  @override
  List<Object?> get props => [];
}

class AddRemoveProductToFavoriteSuccess
    extends AddRemoveProductToFavoriteState {
  const AddRemoveProductToFavoriteSuccess();

  @override
  List<Object?> get props => [];
}

class AddRemoveProductToFavoriteError extends AddRemoveProductToFavoriteState {
  final String message;

  const AddRemoveProductToFavoriteError(this.message);

  @override
  List<Object?> get props => [message];
}
