module Ui exposing (colors, markdown)

import Element exposing (..)
import Element.Font as Font
import Html.Attributes as Attr
import Markdown


colors : { coral : Color, white : Color }
colors =
    { coral = rgb255 200 75 85
    , white = rgb255 255 255 255
    }


viewButton : ( String, String ) -> Element msg
viewButton ( label, url ) =
    text label


markdown : String -> Element msg
markdown =
    let
        defaults =
            Markdown.defaultOptions
    in
    Markdown.toHtmlWith
        { defaults
            | sanitize = False
            , githubFlavored = Just { tables = True, breaks = False }
        }
        [ Attr.class "markdown" ]
        >> Element.html
        >> List.singleton
        >> paragraph []
