#!/usr/bin/env python3
"""
Books Discovery Script for HTML Dashboard
Scans the Books folder and generates HTML for the Books category section
"""

import os
import glob
from pathlib import Path

def generate_books_section():
    """Generate the complete Books category HTML section"""

    # Get the directory where this script is located
    script_dir = Path(__file__).parent
    books_dir = script_dir / "Books"

    # Find all .txt files in the Books directory
    txt_files = []
    if books_dir.exists():
        txt_files = sorted(glob.glob(str(books_dir / "*.txt")))

    # Extract just the filenames without path
    book_names = [os.path.basename(f) for f in txt_files]

    # Generate HTML for each book
    book_items = []
    for book_name in book_names:
        # Create a display name (remove .txt extension and clean up)
        display_name = book_name.replace('.txt', '').replace('_', ' ').replace('-', ' ').title()

        # Escape single quotes in filename for JavaScript
        escaped_filename = book_name.replace("'", "\\'")

        # Create the HTML item
        item_html = f'''                        <div class="file-item" onclick="openBook('Books/{escaped_filename}')">
                            <span class="file-icon txt">📄</span>
                            <div class="file-info">
                                <div class="file-name">{display_name}</div>
                                <div class="file-meta">Text document</div>
                            </div>
                            <span class="file-size">—</span>
                        </div>'''
        book_items.append(item_html)

    # Generate the complete section HTML
    section_html = f'''
            <!-- Books Category -->
            <div class="category-portal" onclick="toggleCategory('books')">
                <div class="category-icon">📚</div>
                <div class="category-title">Books Collection</div>
                <div class="category-description">{len(book_names)} text-based books and manuscripts</div>
                <div class="category-stats">
                    <span class="file-count">{len(book_names)} files</span>
                    <span class="category-arrow">→</span>
                </div>
                <div class="sub-menu" id="books-menu">
                    <div class="sub-menu-header">
                        <div class="sub-menu-title">📚 Complete Books Library</div>
                        <div class="sub-menu-description">Your extensive collection of {len(book_names)} written works</div>
                    </div>
                    <div class="file-list">
{chr(10).join(book_items)}
                    </div>
                </div>
            </div>'''

    return section_html

def main():
    """Main function to generate and display the Books section"""
    print("🔍 Discovering books in the Books folder...")
    books_html = generate_books_section()
    print("✅ Books section generated!")
    print("\n" + "="*80)
    print("COPY THIS HTML INTO YOUR DASHBOARD:")
    print("="*80)
    print(books_html)
    print("="*80)

    # Also save to a file for reference
    with open('books_section_generated.html', 'w', encoding='utf-8') as f:
        f.write(books_html)
    print("📄 HTML also saved to 'books_section_generated.html' for reference")

if __name__ == "__main__":
    main()