import { faker } from "@faker-js/faker";
import fs from "fs";
/////////////////////////Here begin the code////////////////////////

let insertion = "INSERT INTO account "+
                "("+
                    "first_name,last_name,nickname,gender,email,profile_pic"+
                ")";

let intercalaire= " VALUES ";

let data= `\n('${faker.name.firstName()}','${faker.name.lastName()}','${faker.internet.userName()}','${faker.helpers.arrayElement(['M', 'F'])}','${faker.internet.email()}','${faker.image.avatar().replace(".jpg", ".png")}')`

for(let i=1; i<=500_000; i++){

    let components = {
        "firstName": faker.name.firstName().replace("'", ""),
        "lastName": faker.name.lastName().replace("'", ""),
        "userName": faker.internet.userName(),
        "gender": faker.helpers.arrayElement(['M','F']),
        "email": faker.internet.email(),
        "image": faker.image.avatar().replace(".jpg", ".png")
    }

    data += `,\n('${components.firstName}','${components.lastName}','${components.userName}', '${components.gender}','${components.email}','${components.image}')`
}
data += ';';

let generate = insertion + intercalaire + data;

//////////////////////////////Go to generate the file of data.sql//////////////////////////////////////

fs.writeFile('data.sql', generate, (err) => {
    if(err){
        console.log(err)
    }
})