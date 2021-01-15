import { Card, CardContent, Image } from "semantic-ui-react";
import { useContext } from "react";
import { AuthContext } from "../providers/AuthProvider";

const User = () => {
  const { email, name, image } = useContext(AuthContext);

  return (
    <>
      <Card>
        <Image src={image ? image : "https://picsum.photos/200/300"} />
        <Card.Content>
          <Card.Header>
            <CardContent description={name} />
          </Card.Header>
          <CardContent>{email}</CardContent>
        </Card.Content>
      </Card>
    </>
  );
};

export default User;
