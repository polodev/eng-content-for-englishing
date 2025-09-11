## 01-learn-vocabulary-through-stories

**Task**: Convert PDF content to structured JSON following template format with multilingual translations and transliterations.

**Files**:
- Template: `/Users/polodev/sites/eng-content/templates/article-with-story.json`
- Source PDF: `/Users/polodev/sites/eng-content/learn_vocabulary_through_stories/01-learn-vocabulary-through-stories.pdf`
- Output: `response-json/01-learn-vocabulary-through-stories.json`

**Requirements**:
1. Extract all text content from the PDF
2. Structure data following the exact template format
3. Generate translations and transliterations for all missing locales: `bn`, `hi`, `es`, `fr`

**Key Data Type Specifications**:

**`*_native_transliteration`** (JSON object):
- Keys: `bn`, `es`, `fr`, `hi`
- Values: Written in respective native scripts
- Purpose: Help non-English speakers understand English pronunciation using their native script

**`*_transliteration`** (String):
- Written in English letters only
- Purpose: Help English speakers pronounce foreign words
- No non-English characters allowed

**`content_translation`**:
- Translatable JSON string format
- Each locale content must include both:
  - Native language text
  - English words in **markdown bold** (e.g., "**hello** বাংলা")
- English words remain English across all locales

**Output**: Generate complete JSON file with all fields populated, maintaining exact template structure and data types.