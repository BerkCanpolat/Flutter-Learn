part of 'custom_login_button.dart';

mixin _CustomLoginButtonMixin on MountedMixin<CustomLoginButton>, State<CustomLoginButton> {
  ValueNotifier<bool> _isLoadingNorifier = ValueNotifier<bool>(false);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoadingNorifier.value = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> _onPressed(BuildContext context) async {
    _isLoadingNorifier.value = true;
    final response = await widget.onOperation.call();
    await safeOperation(() async{
      if (response) Navigator.of(context).pop();
    _isLoadingNorifier.value = false;
    });
  }
}
