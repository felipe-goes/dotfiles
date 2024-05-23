package parsinglogfiles

import "regexp"

func IsValidLine(text string) bool {
	re := regexp.MustCompile(`^\[(TRC|DBG|INF|WRN|ERR|FTL|)\]`)
	return re.MatchString(text)
}

func SplitLogLine(text string) []string {
	re := regexp.MustCompile(`<([~\*=-]+|)>`)
	return re.Split(text, -1)
}

func CountQuotedPasswords(lines []string) int {
	re := regexp.MustCompile(`(?i)"(.+|)password(.+|)"`)
	count := 0
	for _, v := range lines {
		count += len(re.FindAllString(v, -1))
	}
	return count
}

func RemoveEndOfLineText(text string) string {
	re := regexp.MustCompile(`end-of-line[0-9]+`)
	return re.ReplaceAllString(text, "")
}

func TagWithUserName(lines []string) []string {
	re := regexp.MustCompile("User +[a-zA-Z]+[0-9]+")
	reRemoveUser := regexp.MustCompile("User +")
	var newLines []string
	for _, v := range lines {
		user := re.FindString(v)
		if user == "" {
			newLines = append(newLines, v)
		} else {
			user = reRemoveUser.ReplaceAllString(user, "")
			newLines = append(newLines, "[USR] "+user+" "+v)
		}
	}
	return newLines
}
