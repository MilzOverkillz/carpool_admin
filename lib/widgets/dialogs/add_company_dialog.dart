import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/utils/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

/// Call this from your Companies widget's onActionPressed:
///
///   onActionPressed: () {
///     showDialog(
///       context: context,
///       barrierColor: Colors.black.withOpacity(0.4),
///       builder: (_) => const AddCompanyDialog(),
///     );
///   },

class AddCompanyDialog extends StatefulWidget {
  const AddCompanyDialog({super.key});

  @override
  State<AddCompanyDialog> createState() => _AddCompanyDialogState();
}

class _AddCompanyDialogState extends State<AddCompanyDialog> {
  final _formKey = GlobalKey<FormState>();

  final _companyNameController = TextEditingController();
  final _domainController = TextEditingController();
  final _employeeCountController = TextEditingController();
  final _adminEmailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  String _selectedPlan = 'Free';
  String? _logoFileName;

  final List<String> _plans = ['Free', 'Custom', 'Paid'];

  @override
  void dispose() {
    _companyNameController.dispose();
    _domainController.dispose();
    _employeeCountController.dispose();
    _adminEmailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 40,),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 910),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 44.34, vertical: 22),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Header ──────────────────────────────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Company Managment',
                          style: TextStyle(fontFamily: AppFonts.primary, fontWeight: FontWeight.w700, fontSize: 18, color: Color(0xff212b36))
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Create an new company account',
                          style: TextStyle(
                            fontFamily:AppFonts.dmSans,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            letterSpacing: -0.02,
                            color: Color(0xffa3aed0)
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Color(0xFF64748B)),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),

                SizedBox(height: 25,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // LEFT COLUMN
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel('Company Name'),
                          _buildTextField(
                            controller: _companyNameController,
                            hint: 'Enter Company Name',
                          ),
                          const SizedBox(height: 20),
                          _buildLabel('Domain'),
                          _buildTextField(
                            controller: _domainController,
                            hint: '@company.com',
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Email domain for  employee verification',
                            style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
                          ),
                          const SizedBox(height: 20),

                          _buildLabel('Company Logo'),
                          _buildLogoUpload(),
                          const SizedBox(height: 20),

                          _buildLabel('Number of Employee (Optinal)'),
                          _buildTextField(
                            controller: _employeeCountController,
                            hint: 'e.g. 250',
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 52),

                    // RIGHT COLUMN
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel('Admin Contact Email'),
                          _buildTextField(
                            controller: _adminEmailController,
                            hint: 'admin@company.com',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 20),
                          _buildLabel('Phone'),
                          _buildTextField(
                            controller: _phoneController,
                            hint: 'admin@company.com',
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(height: 20),
                          _buildLabel('Address'),
                          _buildTextField(
                            controller: _addressController,
                            hint: 'admin@company.com',
                          ),
                          const SizedBox(height: 20),
                          _buildLabel('Subscription Plan'),
                          _buildPlanDropdown(),
                        ],
                      ),
                    ),
                  ],
                ),


                // ── Action Buttons ───────────────────────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed:() => context.pop(),
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(113, 32),
                        side: const BorderSide(color: Color(0xFFA6A6A6), width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontFamily: AppFonts.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: _handleSubmit,
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(133, 32),
                        backgroundColor: const Color(0xFF1E272E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Add Company',
                        style: TextStyle(
                          fontFamily: AppFonts.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── Helpers ────────────────────────────────────────────────────────────────

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: AppFonts.primary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0xff262626)
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 14, color: Color(0xFF1E293B)),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontFamily: AppFonts.primary, fontWeight: FontWeight.w400, color: Color(0xFF9A9A9A), fontSize: 12),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF94A3B8)),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildLogoUpload() {
    return GestureDetector(
      onTap: _pickLogo,
      child: Row(
        children: [
          Container(
            height: 43,
            width: 246,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE2E8F0)),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/icons/ic_upload.svg'),
                SizedBox(width: 10),
                Text(
                  'Upload Logo',
                  style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            _logoFileName ?? 'PNG , JPG up to 2MB',
            style: const TextStyle(fontFamily: AppFonts.primary, fontWeight: FontWeight.w400, color: Color(0xFF9A9A9A), fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanDropdown() {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE2E8F0)),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedPlan,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xFF64748B)),
          style: const TextStyle(fontSize: 14, color: Color(0xFF1E293B)),
          items: _plans.map((plan) {
            return DropdownMenuItem<String>(
              value: plan,
              child: Text(plan),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) setState(() => _selectedPlan = value);
          },
        ),
      ),
    );
  }

  void _pickLogo() {
    // TODO: integrate file_picker package
    // Example:
    // final result = await FilePicker.platform.pickFiles(type: FileType.image);
    // if (result != null) setState(() => _logoFileName = result.files.single.name);
    setState(() => _logoFileName = 'logo.png'); // placeholder
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: pass data back to parent or call your API
      Navigator.of(context).pop({
        'companyName': _companyNameController.text,
        'domain': _domainController.text,
        'employeeCount': _employeeCountController.text,
        'adminEmail': _adminEmailController.text,
        'phone': _phoneController.text,
        'address': _addressController.text,
        'subscriptionPlan': _selectedPlan,
      });
    }
  }
}