import '../../../../../auth/presentation/screen/import_files/import_files.dart';

class StepperButtons extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Color color;
  final Color backgroundColor;
  const StepperButtons(
      {super.key,
      required this.title,
      required this.onTap,
      required this.color,required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: TextStyle(fontSize: 12, color: color),
        ),
      ),
    );
  }
}
