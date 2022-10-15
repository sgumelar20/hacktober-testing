SELECT H.hacker_id, H.name, COUNT(C.challenge_id) as no_of_challenges
FROM HACKERS AS H
INNER JOIN CHALLENGES AS C
ON H.hacker_id = C.hacker_id
GROUP BY H.hacker_id, H.name
HAVING no_of_challenges = 
(
    SELECT COUNT(challenge_id) AS max FROM CHALLENGES GROUP BY hacker_id
    ORDER BY max DESC LIMIT 1
) OR
no_of_challenges NOT IN 
(
    SELECT t.cnt FROM (SELECT COUNT(challenge_id) AS cnt FROM CHALLENGES
    GROUP BY hacker_id) t GROUP BY t.cnt HAVING COUNT(t.cnt) != 1
)
ORDER BY COUNT(C.challenge_id) DESC, H.hacker_id;