<?php

namespace App\Model;

class SearchManager extends AbstractManager
{
    public const TABLE = 'playlist';

    public function search(string $item): array
    {
        $query = '
            SELECT 
            t.*, 
            u.nom as username, 
            (SELECT COUNT(playlist_id) FROM votes WHERE playlist_id = t.id AND `like` = 1) as likes,
            (SELECT COUNT(playlist_id) FROM votes WHERE playlist_id = t.id AND `like` = 0) as dislikes 
            FROM ' . static::TABLE . ' t 
            LEFT JOIN utilisateur u ON t.utilisateur_id = u.id
            WHERE t.nom LIKE "%' . $item . '%"
        ';

        return $this->pdo->query($query)->fetchAll(\PDO::FETCH_ASSOC);
    }
}
