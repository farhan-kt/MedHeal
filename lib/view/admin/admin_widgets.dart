import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/controller/admin_provider.dart';
import 'package:medheal/widgets/textformfield_widget.dart';

Widget adminDoctorAddFields(Size size, context, AdminProvider adminProvider) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              controller: adminProvider.doctorNameController,
              hintText: 'Full Name',
              validateMessage: 'Enter Name',
            ),
          ),
        ],
      ),
      Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              controller: adminProvider.doctorAgeController,
              hintText: 'Age',
              width: size.width * .2,
              validateMessage: 'Enter Age',
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: dropDownTextFormField(context,
                selectedValue: adminProvider.selectedGender,
                items: adminProvider.genders,
                hintText: 'Gender',
                validatorMessage: 'Select a Gender',
                onChanged: (String? newValue) {
              if (newValue != null) {
                adminProvider.setSelectedGender(newValue);
              }
            }),
          )
        ],
      ),
      dropDownTextFormField(context,
          selectedValue: adminProvider.selectedCategory,
          items: adminProvider.category,
          validatorMessage: 'Select a category',
          hintText: 'Category', onChanged: (String? newValue) {
        if (newValue != null) {
          adminProvider.setSelectedCategory(newValue);
        }
      }),
      dropDownTextFormField(context,
          selectedValue: adminProvider.selectedPosition,
          items: adminProvider.position,
          validatorMessage: 'Select a position',
          hintText: 'Position', onChanged: (String? newValue) {
        if (newValue != null) {
          adminProvider.setSelectedPosition(newValue);
        }
      }),
      Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              controller: adminProvider.doctorAboutController,
              // maxLines: 4,
              labelText: 'About Doctor',
              validateMessage: 'tPlease fill out this field',
            ),
          ),
        ],
      ),
      poppinsHeadText(text: 'Working information'),
      dropDownTextFormField(context,
          selectedValue: adminProvider.selectedWorkingDays,
          items: adminProvider.workingDays,
          validatorMessage: 'Select working days',
          hintText: 'working days', onChanged: (String? newValue) {
        if (newValue != null) {
          adminProvider.setSelectedWorkingDays(newValue);
        }
      }),
      Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              controller: adminProvider.doctorAppointmentTimeController,
              labelText: "inspection start time",
              validateMessage: 'pick inspection time',
            ),
          ),
          SizedBox(width: size.width * .08),
          Expanded(
            child: CustomTextFormField(
              controller: adminProvider.doctorAppointmentEndTimeController,
              labelText: 'inspection end time',
              validateMessage: 'pick inspection end time',
            ),
          ),
        ],
      ),
      Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              controller: adminProvider.doctorPatientsController,
              labelText: 'Patients',
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(width: size.width * .08),
          Expanded(
            child: CustomTextFormField(
              controller: adminProvider.doctorExperienceController,
              labelText: 'Experience',
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(width: size.width * .08),
          Expanded(
            child: CustomTextFormField(
              controller: adminProvider.doctorRatingController,
              labelText: 'Rating',
              validateMessage: 'Enter Rating',
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    ],
  );
}
