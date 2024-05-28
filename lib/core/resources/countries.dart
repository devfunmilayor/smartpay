import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/resources/app_text_styles.dart';
import 'package:smart_pay/core/shared/smart_pay_field.dart';
import 'package:smart_pay/core/util/num.dart';

class CountryPickerSheet extends StatefulWidget {
  final ScrollController scrollController;
  final Map<String, String>? selectedCountry;
  final ValueChanged<Map<String, String>> onCountrySelected;

  CountryPickerSheet(
      {required this.scrollController,
      required this.onCountrySelected,
      this.selectedCountry});

  @override
  _CountryPickerSheetState createState() => _CountryPickerSheetState();
}

class _CountryPickerSheetState extends State<CountryPickerSheet> {
  final List<Map<String, String>> countries = [
    {'code': 'AF', 'name': 'Afghanistan', 'flag': '🇦🇫'},
    {'code': 'AL', 'name': 'Albania', 'flag': '🇦🇱'},
    {'code': 'DZ', 'name': 'Algeria', 'flag': '🇩🇿'},
    {'code': 'AS', 'name': 'American Samoa', 'flag': '🇦🇸'},
    {'code': 'AD', 'name': 'Andorra', 'flag': '🇦🇩'},
    {'code': 'AO', 'name': 'Angola', 'flag': '🇦🇴'},
    {'code': 'AI', 'name': 'Anguilla', 'flag': '🇦🇮'},
    {'code': 'AG', 'name': 'Antigua and Barbuda', 'flag': '🇦🇬'},
    {'code': 'AR', 'name': 'Argentina', 'flag': '🇦🇷'},
    {'code': 'AM', 'name': 'Armenia', 'flag': '🇦🇲'},
    {'code': 'AW', 'name': 'Aruba', 'flag': '🇦🇼'},
    {'code': 'AU', 'name': 'Australia', 'flag': '🇦🇺'},
    {'code': 'AT', 'name': 'Austria', 'flag': '🇦🇹'},
    {'code': 'AZ', 'name': 'Azerbaijan', 'flag': '🇦🇿'},
    {'code': 'BS', 'name': 'Bahamas', 'flag': '🇧🇸'},
    {'code': 'BH', 'name': 'Bahrain', 'flag': '🇧🇭'},
    {'code': 'BD', 'name': 'Bangladesh', 'flag': '🇧🇩'},
    {'code': 'BB', 'name': 'Barbados', 'flag': '🇧🇧'},
    {'code': 'BY', 'name': 'Belarus', 'flag': '🇧🇾'},
    {'code': 'BE', 'name': 'Belgium', 'flag': '🇧🇪'},
    {'code': 'BZ', 'name': 'Belize', 'flag': '🇧🇿'},
    {'code': 'BJ', 'name': 'Benin', 'flag': '🇧🇯'},
    {'code': 'BM', 'name': 'Bermuda', 'flag': '🇧🇲'},
    {'code': 'BT', 'name': 'Bhutan', 'flag': '🇧🇹'},
    {'code': 'BO', 'name': 'Bolivia', 'flag': '🇧🇴'},
    {'code': 'BA', 'name': 'Bosnia and Herzegovina', 'flag': '🇧🇦'},
    {'code': 'BW', 'name': 'Botswana', 'flag': '🇧🇼'},
    {'code': 'BR', 'name': 'Brazil', 'flag': '🇧🇷'},
    {'code': 'IO', 'name': 'British Indian Ocean Territory', 'flag': '🇮🇴'},
    {'code': 'VG', 'name': 'British Virgin Islands', 'flag': '🇻🇬'},
    {'code': 'BN', 'name': 'Brunei', 'flag': '🇧🇳'},
    {'code': 'BG', 'name': 'Bulgaria', 'flag': '🇧🇬'},
    {'code': 'BF', 'name': 'Burkina Faso', 'flag': '🇧🇫'},
    {'code': 'BI', 'name': 'Burundi', 'flag': '🇧🇮'},
    {'code': 'CV', 'name': 'Cabo Verde', 'flag': '🇨🇻'},
    {'code': 'KH', 'name': 'Cambodia', 'flag': '🇰🇭'},
    {'code': 'CM', 'name': 'Cameroon', 'flag': '🇨🇲'},
    {'code': 'CA', 'name': 'Canada', 'flag': '🇨🇦'},
    {'code': 'KY', 'name': 'Cayman Islands', 'flag': '🇰🇾'},
    {'code': 'CF', 'name': 'Central African Republic', 'flag': '🇨🇫'},
    {'code': 'TD', 'name': 'Chad', 'flag': '🇹🇩'},
    {'code': 'CL', 'name': 'Chile', 'flag': '🇨🇱'},
    {'code': 'CN', 'name': 'China', 'flag': '🇨🇳'},
    {'code': 'CO', 'name': 'Colombia', 'flag': '🇨🇴'},
    {'code': 'KM', 'name': 'Comoros', 'flag': '🇰🇲'},
    {'code': 'CG', 'name': 'Congo - Brazzaville', 'flag': '🇨🇬'},
    {'code': 'CD', 'name': 'Congo - Kinshasa', 'flag': '🇨🇩'},
    {'code': 'CK', 'name': 'Cook Islands', 'flag': '🇨🇰'},
    {'code': 'CR', 'name': 'Costa Rica', 'flag': '🇨🇷'},
    {'code': 'CI', 'name': 'Côte d’Ivoire', 'flag': '🇨🇮'},
    {'code': 'HR', 'name': 'Croatia', 'flag': '🇭🇷'},
    {'code': 'CU', 'name': 'Cuba', 'flag': '🇨🇺'},
    {'code': 'CY', 'name': 'Cyprus', 'flag': '🇨🇾'},
    {'code': 'CZ', 'name': 'Czechia', 'flag': '🇨🇿'},
    {'code': 'DK', 'name': 'Denmark', 'flag': '🇩🇰'},
    {'code': 'DJ', 'name': 'Djibouti', 'flag': '🇩🇯'},
    {'code': 'DM', 'name': 'Dominica', 'flag': '🇩🇲'},
    {'code': 'DO', 'name': 'Dominican Republic', 'flag': '🇩🇴'},
    {'code': 'EC', 'name': 'Ecuador', 'flag': '🇪🇨'},
    {'code': 'EG', 'name': 'Egypt', 'flag': '🇪🇬'},
    {'code': 'SV', 'name': 'El Salvador', 'flag': '🇸🇻'},
    {'code': 'GQ', 'name': 'Equatorial Guinea', 'flag': '🇬🇶'},
    {'code': 'ER', 'name': 'Eritrea', 'flag': '🇪🇷'},
    {'code': 'EE', 'name': 'Estonia', 'flag': '🇪🇪'},
    {'code': 'SZ', 'name': 'Eswatini', 'flag': '🇸🇿'},
    {'code': 'ET', 'name': 'Ethiopia', 'flag': '🇪🇹'},
    {'code': 'FJ', 'name': 'Fiji', 'flag': '🇫🇯'},
    {'code': 'FI', 'name': 'Finland', 'flag': '🇫🇮'},
    {'code': 'FR', 'name': 'France', 'flag': '🇫🇷'},
    {'code': 'GA', 'name': 'Gabon', 'flag': '🇬🇦'},
    {'code': 'GM', 'name': 'Gambia', 'flag': '🇬🇲'},
    {'code': 'GE', 'name': 'Georgia', 'flag': '🇬🇪'},
    {'code': 'DE', 'name': 'Germany', 'flag': '🇩🇪'},
    {'code': 'GH', 'name': 'Ghana', 'flag': '🇬🇭'},
    {'code': 'GI', 'name': 'Gibraltar', 'flag': '🇬🇮'},
    {'code': 'GR', 'name': 'Greece', 'flag': '🇬🇷'},
    {'code': 'GL', 'name': 'Greenland', 'flag': '🇬🇱'},
    {'code': 'GD', 'name': 'Grenada', 'flag': '🇬🇩'},
    {'code': 'GU', 'name': 'Guam', 'flag': '🇬🇺'},
    {'code': 'GT', 'name': 'Guatemala', 'flag': '🇬🇹'},
    {'code': 'GG', 'name': 'Guernsey', 'flag': '🇬🇬'},
    {'code': 'GN', 'name': 'Guinea', 'flag': '🇬🇳'},
    {'code': 'GW', 'name': 'Guinea-Bissau', 'flag': '🇬🇼'},
    {'code': 'GY', 'name': 'Guyana', 'flag': '🇬🇾'},
    {'code': 'HT', 'name': 'Haiti', 'flag': '🇭🇹'},
    {'code': 'HN', 'name': 'Honduras', 'flag': '🇭🇳'},
    {'code': 'HK', 'name': 'Hong Kong SAR China', 'flag': '🇭🇰'},
    {'code': 'HU', 'name': 'Hungary', 'flag': '🇭🇺'},
    {'code': 'IS', 'name': 'Iceland', 'flag': '🇮🇸'},
    {'code': 'IN', 'name': 'India', 'flag': '🇮🇳'},
    {'code': 'ID', 'name': 'Indonesia', 'flag': '🇮🇩'},
    {'code': 'IR', 'name': 'Iran', 'flag': '🇮🇷'},
    {'code': 'IQ', 'name': 'Iraq', 'flag': '🇮🇶'},
    {'code': 'IE', 'name': 'Ireland', 'flag': '🇮🇪'},
    {'code': 'IM', 'name': 'Isle of Man', 'flag': '🇮🇲'},
    {'code': 'IL', 'name': 'Israel', 'flag': '🇮🇱'},
    {'code': 'IT', 'name': 'Italy', 'flag': '🇮🇹'},
    {'code': 'JM', 'name': 'Jamaica', 'flag': '🇯🇲'},
    {'code': 'JP', 'name': 'Japan', 'flag': '🇯🇵'},
    {'code': 'JE', 'name': 'Jersey', 'flag': '🇯🇪'},
    {'code': 'JO', 'name': 'Jordan', 'flag': '🇯🇴'},
    {'code': 'KZ', 'name': 'Kazakhstan', 'flag': '🇰🇿'},
    {'code': 'KE', 'name': 'Kenya', 'flag': '🇰🇪'},
    {'code': 'KI', 'name': 'Kiribati', 'flag': '🇰🇮'},
    {'code': 'XK', 'name': 'Kosovo', 'flag': '🇽🇰'},
    {'code': 'KW', 'name': 'Kuwait', 'flag': '🇰🇼'},
    {'code': 'KG', 'name': 'Kyrgyzstan', 'flag': '🇰🇬'},
    {'code': 'LA', 'name': 'Laos', 'flag': '🇱🇦'},
    {'code': 'LV', 'name': 'Latvia', 'flag': '🇱🇻'},
    {'code': 'LB', 'name': 'Lebanon', 'flag': '🇱🇧'},
    {'code': 'LS', 'name': 'Lesotho', 'flag': '🇱🇸'},
    {'code': 'LR', 'name': 'Liberia', 'flag': '🇱🇷'},
    {'code': 'LY', 'name': 'Libya', 'flag': '🇱🇾'},
    {'code': 'LI', 'name': 'Liechtenstein', 'flag': '🇱🇮'},
    {'code': 'LT', 'name': 'Lithuania', 'flag': '🇱🇹'},
    {'code': 'LU', 'name': 'Luxembourg', 'flag': '🇱🇺'},
    {'code': 'MO', 'name': 'Macao SAR China', 'flag': '🇲🇴'},
    {'code': 'MG', 'name': 'Madagascar', 'flag': '🇲🇬'},
    {'code': 'MW', 'name': 'Malawi', 'flag': '🇲🇼'},
    {'code': 'MY', 'name': 'Malaysia', 'flag': '🇲🇾'},
    {'code': 'MV', 'name': 'Maldives', 'flag': '🇲🇻'},
    {'code': 'ML', 'name': 'Mali', 'flag': '🇲🇱'},
    {'code': 'MT', 'name': 'Malta', 'flag': '🇲🇹'},
    {'code': 'MH', 'name': 'Marshall Islands', 'flag': '🇲🇭'},
    {'code': 'MR', 'name': 'Mauritania', 'flag': '🇲🇷'},
    {'code': 'MU', 'name': 'Mauritius', 'flag': '🇲🇺'},
    {'code': 'MX', 'name': 'Mexico', 'flag': '🇲🇽'},
    {'code': 'FM', 'name': 'Micronesia', 'flag': '🇫🇲'},
    {'code': 'MD', 'name': 'Moldova', 'flag': '🇲🇩'},
    {'code': 'MC', 'name': 'Monaco', 'flag': '🇲🇨'},
    {'code': 'MN', 'name': 'Mongolia', 'flag': '🇲🇳'},
    {'code': 'ME', 'name': 'Montenegro', 'flag': '🇲🇪'},
    {'code': 'MS', 'name': 'Montserrat', 'flag': '🇲🇸'},
    {'code': 'MA', 'name': 'Morocco', 'flag': '🇲🇦'},
    {'code': 'MZ', 'name': 'Mozambique', 'flag': '🇲🇿'},
    {'code': 'MM', 'name': 'Myanmar (Burma)', 'flag': '🇲🇲'},
    {'code': 'NA', 'name': 'Namibia', 'flag': '🇳🇦'},
    {'code': 'NR', 'name': 'Nauru', 'flag': '🇳🇷'},
    {'code': 'NP', 'name': 'Nepal', 'flag': '🇳🇵'},
    {'code': 'NL', 'name': 'Netherlands', 'flag': '🇳🇱'},
    {'code': 'NC', 'name': 'New Caledonia', 'flag': '🇳🇨'},
    {'code': 'NZ', 'name': 'New Zealand', 'flag': '🇳🇿'},
    {'code': 'NI', 'name': 'Nicaragua', 'flag': '🇳🇮'},
    {'code': 'NE', 'name': 'Niger', 'flag': '🇳🇪'},
    {'code': 'NG', 'name': 'Nigeria', 'flag': '🇳🇬'},
    {'code': 'NU', 'name': 'Niue', 'flag': '🇳🇺'},
    {'code': 'NF', 'name': 'Norfolk Island', 'flag': '🇳🇫'},
    {'code': 'KP', 'name': 'North Korea', 'flag': '🇰🇵'},
    {'code': 'MK', 'name': 'North Macedonia', 'flag': '🇲🇰'},
    {'code': 'MP', 'name': 'Northern Mariana Islands', 'flag': '🇲🇵'},
    {'code': 'NO', 'name': 'Norway', 'flag': '🇳🇴'},
    {'code': 'OM', 'name': 'Oman', 'flag': '🇴🇲'},
    {'code': 'PK', 'name': 'Pakistan', 'flag': '🇵🇰'},
    {'code': 'PW', 'name': 'Palau', 'flag': '🇵🇼'},
    {'code': 'PS', 'name': 'Palestine', 'flag': '🇵🇸'},
    {'code': 'PA', 'name': 'Panama', 'flag': '🇵🇦'},
    {'code': 'PG', 'name': 'Papua New Guinea', 'flag': '🇵🇬'},
    {'code': 'PY', 'name': 'Paraguay', 'flag': '🇵🇾'},
    {'code': 'PE', 'name': 'Peru', 'flag': '🇵🇪'},
    {'code': 'PH', 'name': 'Philippines', 'flag': '🇵🇭'},
    {'code': 'PL', 'name': 'Poland', 'flag': '🇵🇱'},
    {'code': 'PT', 'name': 'Portugal', 'flag': '🇵🇹'},
    {'code': 'PR', 'name': 'Puerto Rico', 'flag': '🇵🇷'},
    {'code': 'QA', 'name': 'Qatar', 'flag': '🇶🇦'},
    {'code': 'RO', 'name': 'Romania', 'flag': '🇷🇴'},
    {'code': 'RU', 'name': 'Russia', 'flag': '🇷🇺'},
    {'code': 'RW', 'name': 'Rwanda', 'flag': '🇷🇼'},
    {'code': 'WS', 'name': 'Samoa', 'flag': '🇼🇸'},
    {'code': 'SM', 'name': 'San Marino', 'flag': '🇸🇲'},
    {'code': 'ST', 'name': 'São Tomé and Príncipe', 'flag': '🇸🇹'},
    {'code': 'SA', 'name': 'Saudi Arabia', 'flag': '🇸🇦'},
    {'code': 'SN', 'name': 'Senegal', 'flag': '🇸🇳'},
    {'code': 'RS', 'name': 'Serbia', 'flag': '🇷🇸'},
    {'code': 'SC', 'name': 'Seychelles', 'flag': '🇸🇨'},
    {'code': 'SL', 'name': 'Sierra Leone', 'flag': '🇸🇱'},
    {'code': 'SG', 'name': 'Singapore', 'flag': '🇸🇬'},
    {'code': 'SX', 'name': 'Sint Maarten', 'flag': '🇸🇽'},
    {'code': 'SK', 'name': 'Slovakia', 'flag': '🇸🇰'},
    {'code': 'SI', 'name': 'Slovenia', 'flag': '🇸🇮'},
    {'code': 'SB', 'name': 'Solomon Islands', 'flag': '🇸🇧'},
    {'code': 'SO', 'name': 'Somalia', 'flag': '🇸🇴'},
    {'code': 'ZA', 'name': 'South Africa', 'flag': '🇿🇦'},
    {'code': 'KR', 'name': 'South Korea', 'flag': '🇰🇷'},
    {'code': 'SS', 'name': 'South Sudan', 'flag': '🇸🇸'},
    {'code': 'ES', 'name': 'Spain', 'flag': '🇪🇸'},
    {'code': 'LK', 'name': 'Sri Lanka', 'flag': '🇱🇰'},
    {'code': 'BL', 'name': 'St. Barthélemy', 'flag': '🇧🇱'},
    {'code': 'SH', 'name': 'St. Helena', 'flag': '🇸🇭'},
    {'code': 'KN', 'name': 'St. Kitts and Nevis', 'flag': '🇰🇳'},
    {'code': 'LC', 'name': 'St. Lucia', 'flag': '🇱🇨'},
    {'code': 'MF', 'name': 'St. Martin', 'flag': '🇲🇫'},
    {'code': 'PM', 'name': 'St. Pierre and Miquelon', 'flag': '🇵🇲'},
    {'code': 'VC', 'name': 'St. Vincent and Grenadines', 'flag': '🇻🇨'},
    {'code': 'SD', 'name': 'Sudan', 'flag': '🇸🇩'},
    {'code': 'SR', 'name': 'Suriname', 'flag': '🇸🇷'},
    {'code': 'SE', 'name': 'Sweden', 'flag': '🇸🇪'},
    {'code': 'CH', 'name': 'Switzerland', 'flag': '🇨🇭'},
    {'code': 'SY', 'name': 'Syria', 'flag': '🇸🇾'},
    {'code': 'TW', 'name': 'Taiwan', 'flag': '🇹🇼'},
    {'code': 'TJ', 'name': 'Tajikistan', 'flag': '🇹🇯'},
    {'code': 'TZ', 'name': 'Tanzania', 'flag': '🇹🇿'},
    {'code': 'TH', 'name': 'Thailand', 'flag': '🇹🇭'},
    {'code': 'TL', 'name': 'Timor-Leste', 'flag': '🇹🇱'},
    {'code': 'TG', 'name': 'Togo', 'flag': '🇹🇬'},
    {'code': 'TK', 'name': 'Tokelau', 'flag': '🇹🇰'},
    {'code': 'TO', 'name': 'Tonga', 'flag': '🇹🇴'},
    {'code': 'TT', 'name': 'Trinidad and Tobago', 'flag': '🇹🇹'},
    {'code': 'TN', 'name': 'Tunisia', 'flag': '🇹🇳'},
    {'code': 'TR', 'name': 'Turkey', 'flag': '🇹🇷'},
    {'code': 'TM', 'name': 'Turkmenistan', 'flag': '🇹🇲'},
    {'code': 'TC', 'name': 'Turks and Caicos Islands', 'flag': '🇹🇨'},
    {'code': 'TV', 'name': 'Tuvalu', 'flag': '🇹🇻'},
    {'code': 'UG', 'name': 'Uganda', 'flag': '🇺🇬'},
    {'code': 'UA', 'name': 'Ukraine', 'flag': '🇺🇦'},
    {'code': 'AE', 'name': 'United Arab Emirates', 'flag': '🇦🇪'},
    {'code': 'GB', 'name': 'United Kingdom', 'flag': '🇬🇧'},
    {'code': 'US', 'name': 'United States', 'flag': '🇺🇸'},
    {'code': 'UY', 'name': 'Uruguay', 'flag': '🇺🇾'},
    {'code': 'UZ', 'name': 'Uzbekistan', 'flag': '🇺🇿'},
    {'code': 'VU', 'name': 'Vanuatu', 'flag': '🇻🇺'},
    {'code': 'VA', 'name': 'Vatican City', 'flag': '🇻🇦'},
    {'code': 'VE', 'name': 'Venezuela', 'flag': '🇻🇪'},
    {'code': 'VN', 'name': 'Vietnam', 'flag': '🇻🇳'},
    {'code': 'WF', 'name': 'Wallis and Futuna', 'flag': '🇼🇫'},
    {'code': 'EH', 'name': 'Western Sahara', 'flag': '🇪🇭'},
    {'code': 'YE', 'name': 'Yemen', 'flag': '🇾🇪'},
    {'code': 'ZM', 'name': 'Zambia', 'flag': '🇿🇲'},
    {'code': 'ZW', 'name': 'Zimbabwe', 'flag': '🇿🇼'},
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredCountries = countries.where((country) {
      final nameLower = country['name']!.toLowerCase();
      final queryLower = searchQuery.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: Row(
            children: [
              Expanded(
                  child: SmartPayField(
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: ColorManager.darkPrimary.withOpacity(0.5),
                ),
                inputType: TextInputType.name,
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                isLastField: true,
                hintText: 'Search',
                hasTextfieldLabel: false,
              )),
              SizedBox(width: 1),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel',
                    style: getBoldStyle(color: ColorManager.darkPrimary)),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 22),
            controller: widget.scrollController,
            itemCount: filteredCountries.length,
            itemBuilder: (context, index) {
              final country = filteredCountries[index];
              final isSelected = widget.selectedCountry != null &&
                  widget.selectedCountry!['code'] == country['code'];
              return GestureDetector(
                  onTap: () {
                    widget.onCountrySelected(country);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: isSelected
                            ? ColorManager.grey.withOpacity(0.05)
                            : ColorManager.transparent),
                    child: Row(
                      children: [
                        Text(country['flag']!,
                            style: getMediumStyle(
                                color: ColorManager.darkPrimary, fontSize: 25)),
                        20.0.w,
                        Text(country['code']!,
                            style:
                                getMediumStyle(color: ColorManager.grey, fontSize: 13)),
                        20.0.w,
                        Text(country['name']!,
                            style: getBoldStyle(
                                color: ColorManager.black, fontSize: 13)),
                        if (isSelected)
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                             Icons.check,
                                size: 18,
                                color: ColorManager.primary,
                              ),
                            ),
                          )
                      ],
                    ),
                  ));
            },
          ),
        ),
      ],
    );
  }
}
