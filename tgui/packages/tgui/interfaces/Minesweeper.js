import { useBackend, useLocalState, useSharedState } from '../backend';
import { Window } from '../layouts';
import { Box, Button, Grid, Table } from '../components';
import { TableCell, TableRow, TableBody } from '../components/Table';
import { classes } from '../../common/react';
const HeaderBoxStyle = {
  "color": "#FFFFFF",
  "font-size": "16px",
  "font-weight": "bold",
  "text-align": "center",
};


export const Minesweeper = (props, context) => {
  const { data, act } = useBackend(context);
  
  
  return ( 
    <Window width={1100}
      height={800}
      resizable>
      <Window.Content style={{ "background": "linear-gradient(180deg, #2F4F4F, #1F3A3A)" }}>
        <Box style={{ "text-align": "center" }}>
          <Box style={{ "font-size": "16px", "font-weight": "bold" }}>Minesweeper</Box>
          <Box>Try to find all the mines without stepping on one!</Box>
        </Box>
        <MainBody />
      </Window.Content>
    </Window>
  );
};

const MainBody = (props, context) => {
  const { data, act } = useBackend(context);
  if (data.game_status === 0) {
    return (<MainMenu />);
  } else if (data.game_status === 1) {
    return (<Game />);
  } else {
    return (<GameOver />);
  }
};

const MainMenu = (props, context) => {
  const { data, act } = useBackend(context);
  return (
    <Box style={{ "text-align": "center" }}>
      <Box>
        Select your difficulty
      </Box>
      <Box>
        <Button onClick={() => act("SetDifficulty", { Difficulty: 1 })}>Easy(9x9, 10 mines)</Button>
      </Box>
      <Box>
        <Button onClick={() => act("SetDifficulty", { Difficulty: 2 })}>Medium(16x16, 40 mines)</Button>
      </Box>
      <Box>
        <Button onClick={() => act("SetDifficulty", { Difficulty: 3 })}>Hard(16x30, 99 mines)</Button>
      </Box>
    </Box>
  );
};

const GameOver = (props, context) =>
{
  const { data, act } = useBackend(context);
  if (data.game_status === 2)
  {
    return (
      <Box>
        You lose
        <Box>
          <Button onClick={() => act("MainMenu", {})}>Back to main menu</Button>
        </Box>
      </Box>
    );
  } else {
    return (
      <Box>
        You win!
        <Box>
          <Button onClick={() => act("MainMenu", {})}>Back to main menu</Button>
        </Box>
      </Box>
    );
  }
};

const Mine = (props, context) =>
{
  
  const { data, act } = useBackend(context);
  let minestate = data.Minestates[props.rowid][props.columnid];
  switch (minestate) {
    case "hidden":
      return (
        <Button onClick={() => act("ClickMine", { RowID: (props.rowid + 1), ColumnID: (props.columnid + 1) })} >
          <TableCell style={{ "width": "32px", "height": "32px", "border-style": "solid", "border-width": "1px", "text-align": "center", "background": "url('https://files.catbox.moe/3bxt2m.png')", "background-repeat": "no-repeat", "background-size": "cover" }} />
        </Button>
      );
    case "empty":
      return (
        <TableCell style={{ "width": "32px", "height": "32px", "border-style": "solid", "border-width": "1px", "text-align": "center", "background": "url('https://files.catbox.moe/qsbfn6.png')", "background-repeat": "no-repeat", "background-size": "cover" }} />
      );
    case "flag":
      return (
        <Button onClick={() => act("ClickMine", { RowID: (props.rowid + 1), ColumnID: (props.columnid + 1) })} >
          <TableCell style={{ "width": "32px", "height": "32px", "border-style": "solid", "border-width": "1px", "text-align": "center", "background": "url('https://files.catbox.moe/7jjo8v.png')", "background-repeat": "no-repeat", "background-size": "cover" }} />
        </Button>
      );
    case "mine":
      return (
        <TableCell style={{ "width": "32px", "height": "32px", "border-style": "solid", "border-width": "1px", "text-align": "center", "background": "url('https://files.catbox.moe/k2ysfj.png')", "background-repeat": "no-repeat", "background-size": "cover" }} />
      );
    case "minehit":
      return (
        <TableCell style={{ "width": "32px", "height": "32px", "border-style": "solid", "border-width": "1px", "text-align": "center", "background": "url('https://files.catbox.moe/ximk6r.png')", "background-repeat": "no-repeat", "background-size": "cover" }} />
      );
    case "1":
      return (
        <TableCell style={{ "width": "32px", "height": "32px", "border-style": "solid", "border-width": "1px", "text-align": "center", "background": "url('https://files.catbox.moe/ijgoqw.png')", "background-repeat": "no-repeat", "background-size": "cover" }} />
      );
    case "2":
      return (
        <TableCell style={{ "width": "32px", "height": "32px", "border-style": "solid", "border-width": "1px", "text-align": "center", "background": "url('https://files.catbox.moe/my91gl.png')", "background-repeat": "no-repeat", "background-size": "cover" }} />
      );
    case "3":
      return (
        <TableCell style={{ "width": "32px", "height": "32px", "border-style": "solid", "border-width": "1px", "text-align": "center", "background": "url('https://files.catbox.moe/3mz36b.png')", "background-repeat": "no-repeat", "background-size": "cover" }} />
      );
    case "4":
      return (
        <TableCell style={{ "width": "32px", "height": "32px", "border-style": "solid", "border-width": "1px", "text-align": "center", "background": "url('https://files.catbox.moe/tw2bkv.png')", "background-repeat": "no-repeat", "background-size": "cover" }} />
      );
    case "5":
      return (
        <TableCell style={{ "width": "32px", "height": "32px", "border-style": "solid", "border-width": "1px", "text-align": "center", "background": "url('https://files.catbox.moe/92td8y.png')", "background-repeat": "no-repeat", "background-size": "cover" }} />
      );
    case "6":
      return (
        <TableCell style={{ "width": "32px", "height": "32px", "border-style": "solid", "border-width": "1px", "text-align": "center", "background": "url('https://files.catbox.moe/oqeeyp.png')", "background-repeat": "no-repeat", "background-size": "cover" }} />
      );
    case "7":
      return (
        <TableCell style={{ "width": "32px", "height": "32px", "border-style": "solid", "border-width": "1px", "text-align": "center", "background": "url('https://files.catbox.moe/d28ljs.png')", "background-repeat": "no-repeat", "background-size": "cover" }} />
      );
    case "8":
      return (
        <TableCell style={{ "width": "32px", "height": "32px", "border-style": "solid", "border-width": "1px", "text-align": "center", "background": "url('https://files.catbox.moe/ki02jw.png')", "background-repeat": "no-repeat", "background-size": "cover" }} />
      );
    
  }
  return ("ERROR");
};



const MineTableRow = (props, context) =>
{


  let rowcontents = [];
  for (let i = 0; i < props.columns; i++) {
    rowcontents.push(<Mine minestate="hidden" rowid={props.rowid} columnid={i} />);
  }
  return (
    <tr>
      {rowcontents}
    </tr>
  );
};

const Game = (props, context) => {
  const { data, act } = useBackend(context);
  const [getFormattedSampleData, setFormattedSampleData] = useSharedState(context, "Minefield", []);
  

  const test = <tr><td>test!</td></tr>;
  let returnarray = [];
  let tablecontents = [];
  for (let i = 0; i < data.Rows; i++) {
    returnarray[i] = { "rowid": i, "Columns": data.Columns };
    tablecontents.push(<MineTableRow rowid={i} columns={data.Columns} />);
  }
  let tablewidth = data.Columns * 32;
  let flaggingbutton;
  if (data.FlagMode)
  {
    flaggingbutton = "Current mode: Flagging";
  } else {
    flaggingbutton = "Current mode: Minesweeping";
  }
  return (
    <Box>    
      <Box>
        <Button onClick={() => act("MainMenu", {})}>Back to main menu</Button>
      </Box>
      <Box>
        <Table width={tablewidth + "px"} style={{ "margin-left": "auto", "margin-right": "auto" }} >
          {tablecontents}
        </Table>
      </Box>
      <Box>
        <Button onClick={() => act("ToggleFlag", {})}>
          {flaggingbutton}
        </Button>
      </Box>
    </Box>
  );
};


