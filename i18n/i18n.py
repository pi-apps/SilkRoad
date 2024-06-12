# i18n.py
import gettext

class I18N:
    def __init__(self, language_code):
        self.language_code = language_code
        self.translations = gettext.translation('silkroad', localedir='locale', languages=[language_code])

    def translate(self, text):
        return self.translations.gettext(text)
