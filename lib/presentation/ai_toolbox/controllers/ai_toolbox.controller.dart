import 'package:get/get.dart';
import 'package:pixlify/components/images/images.dart';

class AiToolboxController extends GetxController {
  // TODO: ADD ALL ROUTES.
  final tools = <ToolboxItem>[
    ToolboxItem(
      title: 'AI Avatar Generator',
      description: 'Turn your photo or selfie into an AI avatar',
      image: Images.AiAvatarGenThumb,
      route: '',
    ),
    ToolboxItem(
      title: 'AI Photo Generator',
      description: 'Create multiple variations from a single photo',
      image: Images.AiPhotoGenThumb,
      route: '',
    ),
    ToolboxItem(
      title: 'AI Magic Eraser Photo',
      description: 'Remove unwanted objects from a photo in just one tap',
      image: Images.AiMagicEraseThumb,
      route: '',
    ),
    ToolboxItem(
      title: 'AI Background Remover',
      description: 'Remove background from a photo in just one click',
      image: Images.AiBgEraseThumb,
      route: '',
    ),
    ToolboxItem(
      title: 'AI Photo Recoloring',
      description: 'Change the color of the image with a variety of styles',
      image: Images.AiPhotoRecolorThumb,
      route: '',
    ),
    ToolboxItem(
      title: 'AI Old Photo Restoration',
      description: 'Enhance the quality of old photos so they look great',
      image: Images.AiOldPhotoRestoreThumb,
      route: '',
    ),
    ToolboxItem(
      title: 'AI Old Photo Colorization',
      description: 'Colorize an old photo so it looks more alive',
      image: Images.AiOldPhotoColorThumb,
      route: '',
    ),
    ToolboxItem(
      title: 'Extend Images',
      description: 'Change the aspect ratio of your image with one click',
      image: Images.ExtendImageThumb,
      route: '',
    ),
    ToolboxItem(
      title: 'Batch Enhance',
      description: 'Enhance a batch of photos at once in one tap',
      image: Images.BatchEnhanceThumb,
      route: '',
    ),
  ];
}

class ToolboxItem {
  final String title;
  final String description;
  final String image;
  final String route;
  ToolboxItem({
    required this.title,
    required this.description,
    required this.image,
    required this.route,
  });
}
