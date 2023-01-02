import 'package:flutter_pet_app/constants/constant_exports.dart';
import 'package:flutter_pet_app/models/pet_model.dart';

class CategoryModel {
  int id;
  String categoryImage, categoryName;
  List<PetModel> petmodels;
  CategoryModel({
    required this.id,
    required this.categoryImage,
    required this.categoryName,
    required this.petmodels,
  });
}

class CategoryService {
  static List<CategoryModel> categoryLists = [
    CategoryModel(
      id: 0,
      categoryImage: ImageConstants.categoryImage1,
      categoryName: 'Cat',
      petmodels: [
        PetModel(
          petName: 'Moutouik',
          petImage: ImageConstants.categoryImage1,
          petDistance: '5km',
          categoryId: 0,
        ),
      ],
    ),
    CategoryModel(
      id: 1,
      categoryImage: ImageConstants.categoryImage2,
      categoryName: 'Dog',
      petmodels: [
        PetModel(
          petName: 'Samantha',
          petImage: ImageConstants.categoryImage1,
          petDistance: '10km',
          categoryId: 1,
        ),
        PetModel(
          petName: 'Kitly',
          petImage: ImageConstants.categoryImage1,
          petDistance: '5km',
          categoryId: 1,
        ),
      ],
    ),
    CategoryModel(
      id: 2,
      categoryImage: ImageConstants.categoryImage3,
      categoryName: 'Fish',
      petmodels: [
        PetModel(
          petName: 'Fisher',
          petImage: ImageConstants.categoryImage1,
          petDistance: '100km',
          categoryId: 2,
        ),
        PetModel(
          petName: 'Fisher11',
          petImage: ImageConstants.categoryImage1,
          petDistance: '20km',
          categoryId: 2,
        ),
        PetModel(
          petName: 'Fishered',
          petImage: ImageConstants.categoryImage1,
          petDistance: '2km',
          categoryId: 2,
        ),
      ],
    ),
    CategoryModel(
      id: 3,
      categoryImage: ImageConstants.categoryImage4,
      categoryName: 'Chick',
      petmodels: [
        PetModel(
          petName: 'Quak',
          petImage: ImageConstants.categoryImage1,
          petDistance: '20km',
          categoryId: 3,
        ),
      ],
    ),
    CategoryModel(
      id: 4,
      categoryImage: ImageConstants.categoryImage5,
      categoryName: 'Rabbit',
      petmodels: [
        PetModel(
          petName: 'Keimi',
          petImage: ImageConstants.categoryImage1,
          petDistance: '1km',
          categoryId: 4,
        ),
        PetModel(
          petName: 'Bobo',
          petImage: ImageConstants.categoryImage1,
          petDistance: '5km',
          categoryId: 4,
        ),
      ],
    ),
  ];
}
