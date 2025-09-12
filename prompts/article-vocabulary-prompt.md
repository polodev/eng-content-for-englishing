## 01-learn-vocabulary-through-stories

**Task**: Convert PDF content to structured JSON following template format with bilingual translations and transliterations.

**Files**:
- Template: `/Users/polodev/sites/eng-content/templates/article-with-story.json`
- Source PDF: `/Users/polodev/sites/eng-content/learn_vocabulary_through_stories/01-learn-vocabulary-through-stories.pdf`
- Output: `response-json/01-learn-vocabulary-through-stories.json`

**CRITICAL: The PDF already contains Bengali (bn) content with mixed Bengali+English text. DO NOT modify the Bengali content - use it exactly as provided in the PDF.**

**Requirements**:
1. Extract all text content from the PDF
2. Structure data following the exact template format
3. For `content_translation["bn"]`: Use the exact Bengali text from PDF (it already has **bold English words** mixed with Bengali)
4. Work with two locales: `en` and `bn`

**Key Data Type Specifications**:

**NATIVE TRANSLITERATIONS (for English content):**

**`word_native_transliteration`** (JSON object):
- Key: `bn`
- Value: How the **English word** sounds when written in Bengali script
- Example: English word "happiness" → `{"bn": "হ্যাপিনেস"}`
- Purpose: Help Bengali speakers pronounce English words using Bengali script

**`example_sentence_native_transliteration`** (JSON object):
- Key: `bn`
- Value: How the **entire English sentence** sounds when written in Bengali script
- Example: English sentence "She couldn't hide her happiness" → `{"bn": "শী কুডন্ট হাইড হার হ্যাপিনেস হোয়েন শী রিসিভড দ্য অ্যাওয়ার্ড।"}`
- Purpose: Help Bengali speakers read English sentences using Bengali script

**TRANSLITERATIONS (for Bengali content):**

**`word_transliteration`** (String):
- The **Bengali word** written in English letters
- Example: Bengali word "সুখ" → "shukh"
- Purpose: Help English speakers pronounce Bengali words

**`example_sentence_transliteration`** (String):
- The **Bengali sentence** written in English letters
- Example: Bengali sentence "তিনি পুরস্কার পাওয়ার সময় তার সুখ লুকাতে পারেননি।" → "Tini puroshkar paowar somoy tar shukh lukate parenni."
- Purpose: Help English speakers read Bengali sentences

**TRANSLATIONS (actual meaning in different language):**

**`word_translation`** (String):
- The actual Bengali meaning of the English word
- Example: English "happiness" → Bengali "সুখ"

**`example_sentence_translation`** (String):
- The Bengali translation of the English sentence's meaning
- Example: English "She couldn't hide her happiness when she received the award." → Bengali "তিনি পুরস্কার পাওয়ার সময় তার সুখ লুকাতে পারেননি।"

**Summary of the pattern:**
- **native_transliteration**: English content → how it sounds in Bengali script (হ্যাপিনেস)
- **transliteration**: Bengali content → how it sounds in English letters (shukh)
- **translation**: Actual meaning conversion between languages

**`content_translation`** FORMAT:
- **Bengali (bn)**: Use EXACT text from PDF (already contains **bold English** words mixed with Bengali text)
- **English (en)**: Provide clean English translation where the same vocabulary words remain **bold** for emphasis

**Example**:
If PDF Bengali content has: "**Volunteering** একটি **profound initiative**, যা সমাজ ও মানুষের জীবন **transform** করতে পারে।"
- bn: "**Volunteering** একটি **profound initiative**, যা সমাজ ও মানুষের জীবন **transform** করতে পারে।" (exact from PDF)
- en: "**Volunteering** is a **profound initiative** that can **transform** society and people's lives." (clean English with same words bolded)

**Word List Extraction**: 
- Extract vocabulary items from the **vocabulary table** provided in the PDF
- The PDF contains a structured table with columns for:
  - Words (with pronunciation/phonetic)
  - Parts of speech
  - Synonyms
  - Antonyms
  - Bangla Translation
  - Example sentences and translations
  - Meaning
- Extract ALL vocabulary entries from this table
- Ensure no vocabulary items from the table are missed or truncated
- Each vocabulary entry should include all the details provided in the table

**Important Notes**:
- Do NOT search for bold words in the content for vocabulary - use the vocabulary table
- The vocabulary table appears generally on pages 2-4 of the PDF. (in most of the case)
- Maintain the exact structure and format from the template
- Keep all Bengali text exactly as it appears in the PDF