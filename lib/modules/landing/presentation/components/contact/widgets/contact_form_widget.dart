import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/extensions/localization_extension.dart';
import '../../../../../../core/utils/dialog_utils.dart';
import '../../../bloc/landing_bloc.dart';
import '../../../bloc/landing_event.dart';
import '../../../bloc/landing_state.dart';
import 'custom_text_field.dart';

class ContactFormWidget extends StatefulWidget {
  const ContactFormWidget({super.key});

  @override
  State<ContactFormWidget> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _detailsController = TextEditingController();

  void _submitForm() {
    if (_nameController.text.isEmpty || _phoneController.text.isEmpty) {
      AppDialogs.showError(
        context: context,
        message: context.l10n.formErrorMessage,
      );
      return;
    }

    context.read<LandingBloc>().add(
      SubmitForm({
        "name": _nameController.text,
        "phone": _phoneController.text,
        "details": _detailsController.text,
      }),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LandingBloc, LandingState>(
      listener: (context, state) {
        if (state is FormSubmitted) {
          _nameController.clear();
          _phoneController.clear();
          _detailsController.clear();
          AppDialogs.showSuccess(
            context: context,
            title: context.l10n.formSuccessTitle,
            content: context.l10n.formSuccessMessage,
          );
        } else if (state is FormError) {
          AppDialogs.showError(
            context: context,
            message: state.message,
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.heroGetQuote,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              context.l10n.formSuccessMessage,
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    label: context.l10n.heroFullName,
                    hint: 'محمد عبد الله',
                    controller: _nameController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextField(
                    label: context.l10n.heroPhone,
                    hint: '01xxxxxxxxx',
                    controller: _phoneController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: context.l10n.heroOrderDetails,
              hint: 'مثلا: محتاج 500 علبة ديليفري بمقاس...',
              maxLines: 4,
              controller: _detailsController,
            ),
            const SizedBox(height: 32),
            BlocBuilder<LandingBloc, LandingState>(
              buildWhen: (previous, current) => 
                current is FormSubmitting || current is FormSubmitted || current is FormError || current is LandingLoaded,
              builder: (context, state) {
                final isLoading = state is FormSubmitting;
                
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: isLoading 
                      ? const SizedBox(
                          height: 20, 
                          width: 20, 
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                      : Text(
                          context.l10n.heroSendOrder,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
