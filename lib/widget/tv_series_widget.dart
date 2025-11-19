import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_16/theme/color.dart';

class TvSeriesItemWidget extends StatelessWidget {
  final String image;
  final String title;
  final String type;
  final String language;
  final VoidCallback onFavoriteTap;


  final String? category;
  final String? price;
  final String? text;
  final Color? buttonCollor;
  final Icon? prefixIcon;
  final VoidCallback? onTapMark;

  const TvSeriesItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.type,
    required this.language,
    required this.onFavoriteTap,
    this.category,
    this.price,
    this.text,
    this.buttonCollor,
    this.prefixIcon,
    this.onTapMark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        shadowColor: AppColor.neutralgraydark,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
  
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  image,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (c, o, s) => Container(
                    height: 250,
                    color: Colors.grey.shade300,
                    child: const Center(child: Icon(Icons.broken_image)),
                  ),
                ),
              ),

              const SizedBox(height: 15),

     
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

        
              Text(
                "Type: $type",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 4),

       
              Text(
                "Language: $language",
                style: TextStyle(
                  fontSize: 13,
                  color: AppColor.neutralgraydark,
                ),
              ),

              const SizedBox(height: 10),

              // Opsional Category
              if (category != null)
                Text(
                  "Category: $category",
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColor.neutralgraydark,
                  ),
                ),

              // Opsional Price
              if (price != null)
                Text(
                  "Price: $price",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              const SizedBox(height: 15),

        
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: onFavoriteTap,
                  icon: prefixIcon ??
                      Icon(Icons.bookmark, color: AppColor.neutrallight),
                  label: Text(
                    text ?? "Bookmark",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.neutrallight,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonCollor ?? AppColor.primaryblue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),

              const SizedBox(height: 10),

         
              if (onTapMark != null)
                GestureDetector(
                  onTap: onTapMark,
                  child: const Text(
                    "Mark This",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
