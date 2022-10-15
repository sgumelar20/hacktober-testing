SELECT h.hacker_id, h.name, s.total_score
FROM (
    SELECT hacker_id, SUM(maxim) AS total_score
    FROM(
        SELECT hacker_id, MAX(score) AS maxim 
        FROM Submissions 
        GROUP BY hacker_id, challenge_id
    ) plus
    GROUP BY hacker_id
) s
INNER JOIN Hackers AS h
ON h.hacker_id = s.hacker_id
WHERE s.total_score <> 0
ORDER BY total_score DESC, hacker_id;