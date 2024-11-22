
public class TextNormalizer {
    
    // Method to normalize text based on the given rules
    public String normalize(String text) {
        // Remove multiple spaces between words
        text = text.replaceAll(" +", " ").trim();
        
        // Ensure single space after punctuation marks
        text = text.replaceAll("[ ]*([,.!?:;])[ ]*", "$1 ");        
        text = text.replaceAll("\\s+([,.!?:;])", "$1"); // Ensure no space before punctuation

        // Capitalize the first word of the text
        text = Character.toUpperCase(text.charAt(0)) + text.substring(1);
        
        // Capitalize after periods and lowercase other words
        StringBuilder normalizedText = new StringBuilder();
        boolean capitalizeNext = false;
        
        for (int i = 0; i < text.length(); i++) {
            char currentChar = text.charAt(i);

            if (capitalizeNext && Character.isLetter(currentChar)) {
                normalizedText.append(Character.toUpperCase(currentChar));
                capitalizeNext = false;
            } else {
                normalizedText.append(Character.toLowerCase(currentChar));
            }

            if (currentChar == '.') {
                capitalizeNext = true;
            }
        }
        
        // Ensure the text ends with a period
        if (normalizedText.charAt(normalizedText.length() - 1) != '.') {
            normalizedText.append('.');
        }

        String data = normalizedText.toString();
        data = Character.toUpperCase(data.charAt(0)) + data.substring(1);
        
        String res = "";
        String[] sentences = data.split("\"");
        for (int i = 0; i < sentences.length; i++) {            
            if (i %2== 1) {
                res += " \"" + sentences[i].trim() + "\" ";
            } else {
                res += sentences[i].trim();
            }
        }
        return res.trim();
    }
}
