fn main() {
    let visitor: Visitor = Visitor {
        kind: Role::User,
        message: "Welcome",
    };
    let admin: Visitor = Visitor {
        kind: Role::Admin,
        message: "Hello",
    };
    let second_admin: Visitor = Visitor {
        kind: Role::Admin,
        message: "Hey",
    };

    visitor.say_message();
    visitor.tell_role();

    admin.tell_role();
    admin.say_message();

    second_admin.tell_role();
    second_admin.say_message();
}

#[derive(Debug)]
enum Role {
    User,
    Admin,
}

struct Visitor<'a> {
    kind: Role,
    message: &'a str,
}

impl Visitor<'_> {
    fn tell_role(&self) {
        println!("{}{:?}", "Kind: ", self.kind);
    }
    fn say_message(&self) {
        println!("{}{:?}", "Message : ", self.message);
    }
}



