import { Header } from "semantic-ui-react";
import DropZoneDemo from "../components/DropZoneDemo";
import PostForm from "../components/PostForm";

export default () => {
  return (
    <>
      <Header>Home</Header>
      <hr />
      <PostForm />
      <hr />
      <DropZoneDemo />
    </>
  );
};
