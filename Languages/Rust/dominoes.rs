
use rand::prelude::*;

type Tile = [u8; 2];
type Set = Vec<Tile>;
type Game = Vec<Set>;


struct Dominoes {
    highest_suit: u8,
    number_of_players: u8,
}

impl Dominoes {
    fn get_set(&self)-> Set {
        let mut set: Set = Set::new();

        let mut repeated_piece_index: u8 = 0;
        for left in 0..self.highest_suit + 1 {
            for right in 0..self.highest_suit + 1 {
                if right >= repeated_piece_index {
                    let tile: Tile = [left, right];
                    set.push(tile);
                }
            }
                repeated_piece_index += 1;
        }
        set
    }

    fn get_number_of_pieces_per_player(&self) -> u8 {
        let suite: Set = self.get_set();
        let len: u8 = suite.len() as u8;
        len / self.number_of_players

    }

    fn get_game(&self) -> Game {
        let suite: Set = self.get_set();
        let number_of_pieces_per_player: u8 = self.get_number_of_pieces_per_player();
        let mut game: Game = Vec::new();

        let mut rng: ThreadRng = rand::thread_rng();
        let mut nums: Vec<u8> = (0..suite.len() as u8).collect();
        nums.shuffle(&mut rng);

        let mut counter: usize = 0;

        for _player in 0..self.number_of_players {
            let mut set: Set = Set::new();
            for _hand in 0..usize::from(number_of_pieces_per_player) {
              let random_position: u8 = nums[counter];
              let tile: Tile = suite[usize::from(random_position)];
              set.push(tile);
              counter += 1;
            }
            game.push(set);

        }
        game
    }
}

fn main() {
    let dominoes: Dominoes = Dominoes{ highest_suit: 6, number_of_players: 4 };
    let game: Game = dominoes.get_game();

    for index in 0..game.len() {
        println!("Player {:?} has this set of pieces: {:?}", index + 1, game[index]);
        println!();

    }
}

#[test]
fn each_player_should_have_correct_number_of_pieces(){
    let dominoes: Dominoes = Dominoes{ highest_suit: 6, number_of_players: 4  };
    let players: Game = dominoes.get_game();

    // Number of players
    assert_eq!(players.len(), 4);

    let mut total: usize = 0;

    for pieces in players {
       // Each player should have 7 pieces
       assert_eq!(pieces.len(), 7);
       total += pieces.len();

    }

       assert_eq!(total, 28);


}

#[test]
fn should_not_have_repeated_pieces() {
    let dominoes: Dominoes = Dominoes{ highest_suit: 6, number_of_players: 4  };
    let game: Game = dominoes.get_game();
    let mut flat_vector: Vec<u8> = Vec::new();


    for player in game{
        for tile in player{
            for value in tile {
               flat_vector.push(value);

            }
        }
    }
    flat_vector.sort();
    
    let mut expected: Vec<u8> = Vec::new();

    for value in 0..7 as u8 {
        for _index in 0..8 as u8{
            expected.push(value);
        }
    }

    assert_eq!(expected, flat_vector);

}




