use rand::prelude::*;

fn main() {
    let dominoes = Dominoes{ highest_suit: 6, number_of_players: 4 };
    let set = dominoes.get_set();
    println!("{:?}", set);
}

struct Dominoes {
    highest_suit: u8,
    number_of_players: u8,
}

type Piece = [u8; 2];
type Set = Vec<Piece>;

impl Dominoes {
    fn get_suits(&self)-> Set {
        let mut set = Set::new();

        let mut repeated_piece_index = 0;
        for left in 0..self.highest_suit + 1 {
            for right in 0..self.highest_suit + 1 {
                if right >= repeated_piece_index {
                    let piece = [left, right];
                    set.push(piece);
                }
            }
                repeated_piece_index += 1;
        }
        set
    }

    fn get_number_of_pieces_per_player(&self) -> u8 {
        let suite = self.get_suits();
        let len = suite.len() as u8;
        len / self.number_of_players

    }

    fn get_set(&self) -> Vec<Set> {
        let suite = self.get_suits();
        let number_of_pieces_per_player = self.get_number_of_pieces_per_player();
        let mut set = Vec::new();

        let mut rng = rand::thread_rng();
        let mut nums: Vec<u8> = (0..suite.len() as u8).collect();
        nums.shuffle(&mut rng);

        let mut counter: usize = 0;

        for _player in 1..self.number_of_players {
            let mut hand = Set::new();
            for _hand in 0..usize::from(number_of_pieces_per_player) {
              let random_position = nums[counter];
              let piece = suite[usize::from(random_position)];
              hand.push(piece);
              counter += 1;
            }
            set.push(hand);

        }
        set
    }
}
