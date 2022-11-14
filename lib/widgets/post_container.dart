import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook/config/palette.dart';
import 'package:flutter_facebook/models/post_model.dart';
import 'package:flutter_facebook/widgets/profile_avatar.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(
                  post: post,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(post.caption,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
                const SizedBox(
                  height: 6,
                ),
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: post.imageUrl.toString()),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _PostFooter(
              post: post,
            ),
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.user.name,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} •',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
      ],
    );
  }
}

class _PostFooter extends StatelessWidget {
  final Post post;
  const _PostFooter({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                  color: Palette.facebookBlue, shape: BoxShape.circle),
              child: const Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Text('${post.comments} Comments',
                style: TextStyle(color: Colors.grey[600])),
            const SizedBox(
              width: 8,
            ),
            Text('${post.shares} Shares',
                style: TextStyle(color: Colors.grey[600])),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(Icons.thumb_up, color: Colors.grey[400]),
              label: 'Like',
              onTap: () {},
            ),
            _PostButton(
              icon: Icon(Icons.messenger, color: Colors.grey[400]),
              label: 'Comment',
              onTap: () {},
            ),
            _PostButton(
              icon: Icon(Icons.share, color: Colors.grey[400]),
              label: 'Share',
              onTap: () {},
            )
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function()? onTap;
  const _PostButton(
      {Key? key, required this.icon, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              icon,
              const SizedBox(
                width: 4,
              ),
              Text(
                label,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
