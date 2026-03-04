// lib/widgets/collapsible_section.dart
import 'package:flutter/material.dart';

class CollapsibleSection extends StatefulWidget {
  final String title;
  final int itemCount;
  final int selectedCount;
  final List<Widget> children;
  final VoidCallback? onAddPressed;
  final bool initiallyExpanded;
  final double collapsedHeight;

  const CollapsibleSection({
    super.key,
    required this.title,
    required this.itemCount,
    this.selectedCount = 0,
    required this.children,
    this.onAddPressed,
    this.initiallyExpanded = false,
    this.collapsedHeight = 56.0,
  });

  @override
  State<CollapsibleSection> createState() => _CollapsibleSectionState();
}

class _CollapsibleSectionState extends State<CollapsibleSection>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late AnimationController _animationController;
  late Animation<double> _iconTurns;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _iconTurns = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    if (_isExpanded) _animationController.value = 1.0;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      _isExpanded
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          // Заголовок секции
          InkWell(
            onTap: _toggleExpand,
            child: Container(
              height: widget.collapsedHeight,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.2),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Row(
                children: [
                  // Иконка сворачивания
                  RotationTransition(
                    turns: _iconTurns,
                    child: const Icon(Icons.expand_more,
                        color: Colors.amber, size: 24),
                  ),
                  const SizedBox(width: 8),
                  // Заголовок
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // Счётчик выбранных / доступных
                  if (widget.selectedCount > 0) ...[
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 198, 159, 0)
                            .withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        '${widget.selectedCount}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${widget.itemCount}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  // Кнопка "+"
                  if (widget.onAddPressed != null)
                    IconButton(
                      onPressed: widget.onAddPressed,
                      icon: const Icon(Icons.add_circle,
                          color: Color.fromARGB(255, 177, 139, 2), size: 35),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                ],
              ),
            ),
          ),
          // Контент секции
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Container(
              constraints: const BoxConstraints(
                minHeight: 50, // ← минимальная высота контента
              ),
              padding: const EdgeInsets.all(16),
              child: Column(children: widget.children),
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}
