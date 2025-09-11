## 01-learn-vocabulary-through-stories

**Task**: Convert PDF content to structured JSON following template format with multilingual translations and transliterations.

**Files**:
- Template: `/Users/polodev/sites/eng-content/templates/article-with-story.json`
- Source PDF: `/Users/polodev/sites/eng-content/learn_vocabulary_through_stories/01-learn-vocabulary-through-stories.pdf`
- Output: `response-json/01-learn-vocabulary-through-stories.json`

**CRITICAL: The PDF already contains Bengali (bn) content with mixed Bengali+English text. DO NOT modify the Bengali content - use it exactly as provided in the PDF.**

**Requirements**:
1. Extract all text content from the PDF
2. Structure data following the exact template format
3. For `content_translation["bn"]`: Use the exact Bengali text from PDF (it already has **bold English words** mixed with Bengali)
4. Generate translations for missing locales: `hi`, `es` only

**Key Data Type Specifications**:

**`*_native_transliteration`** (JSON object):
- Keys: `bn`, `es`, `hi`
- Values: How English words sound when written in native scripts
- Example: English "hello" → Bengali "হ্যালো", Hindi "हैलो", Spanish "jélo"
- Purpose: Help non-English speakers pronounce English words using their script

**`*_transliteration`** (String):
- Written in English letters ONLY
- Purpose: Help English speakers pronounce foreign words
- Example: Bengali "নমস্কার" → "nomoshkar"
- No Bengali/Hindi/Spanish characters allowed

**`content_translation`** FORMAT:
- **Bengali (bn)**: Use EXACT text from PDF (already contains **bold English** + Bengali)
- **Other locales (hi, es)**: 
  - Translate ONLY the Bengali portions to target language
  - Keep ALL English words **bold** and unchanged
  - Format: "**English word** translated-text **another English word** more-translated-text"

**Example**:
If PDF has: "**Volunteering** একটি **profound initiative**"
- bn: "**Volunteering** একটি **profound initiative**" (exact from PDF)
- hi: "**Volunteering** एक **profound initiative**" (translate "একটি" to "एक")
- es: "**Volunteering** es una **profound initiative**" (translate "একটি" to "es una")

**Word list extraction**: Extract highlighted/**bold** English words from PDF content for vocabulary definitions.