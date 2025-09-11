my template file is `/Users/polodev/sites/eng-content/templates/article-with-story.json`
my pdf is in `/Users/polodev/sites/eng-content/learn_vocabulary_through_stories/01-learn-vocabulary-through-stories.pdf`

please convert pdf content to text content and make a json file inside `response-json` folder with name like pdf. json file should follow template style. exact same as template. as it has only single language. so other locale need to be done: translation, transliteration and native_transliteration
basic about 2 terms: 
- `*_native_transliteration`: datatype json with [bn, es, fr, hi] keys. written in respective language. Help non english speakers to know english pronunciation.
- `*_transliteration`: datatype string. written in Pure English. Help english speakers know its pronunciation 