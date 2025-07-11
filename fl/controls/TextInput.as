package fl.controls
{
   import fl.core.InvalidationType;
   import fl.core.UIComponent;
   import fl.events.ComponentEvent;
   import fl.managers.IFocusManager;
   import fl.managers.IFocusManagerComponent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.TextEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.text.TextLineMetrics;
   import flash.ui.Keyboard;
   
   [Style(name="embedFonts",type="Boolean")]
   [Style(name="disabledSkin",type="Class")]
   [Style(name="textPadding",format="Length",type="Number")]
   [Style(name="upSkin",type="Class")]
   [Event(name="textInput",type="flash.events.TextEvent")]
   [Event(name="enter",type="fl.events.ComponentEvent")]
   [Event(name="change",type="flash.events.Event")]
   public class TextInput extends UIComponent implements IFocusManagerComponent
   {
      
      private static var defaultStyles:Object = {
         "upSkin":"TextInput_upSkin",
         "disabledSkin":"TextInput_disabledSkin",
         "focusRectSkin":null,
         "focusRectPadding":null,
         "textFormat":null,
         "disabledTextFormat":null,
         "textPadding":0,
         "embedFonts":false
      };
      
      public static var createAccessibilityImplementation:Function;
       
      
      public var textField:TextField;
      
      protected var _editable:Boolean = true;
      
      protected var background:DisplayObject;
      
      protected var _html:Boolean = false;
      
      protected var _savedHTML:String;
      
      public function TextInput()
      {
         super();
      }
      
      public static function getStyleDefinition() : Object
      {
         return defaultStyles;
      }
      
      [Inspectable(defaultValue="")]
      public function get text() : String
      {
         return textField.text;
      }
      
      public function set text(param1:String) : void
      {
         textField.text = param1;
         _html = false;
         invalidate(InvalidationType.DATA);
         invalidate(InvalidationType.STYLES);
      }
      
      [Inspectable(defaultValue="true",verbose="1")]
      override public function get enabled() : Boolean
      {
         return super.enabled;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         updateTextFieldType();
      }
      
      public function get imeMode() : String
      {
         return _imeMode;
      }
      
      public function set imeMode(param1:String) : void
      {
         _imeMode = param1;
      }
      
      public function get alwaysShowSelection() : Boolean
      {
         return textField.alwaysShowSelection;
      }
      
      public function set alwaysShowSelection(param1:Boolean) : void
      {
         textField.alwaysShowSelection = param1;
      }
      
      override public function drawFocus(param1:Boolean) : void
      {
         if(focusTarget != null)
         {
            focusTarget.drawFocus(param1);
            return;
         }
         super.drawFocus(param1);
      }
      
      [Inspectable(defaultValue="true")]
      public function get editable() : Boolean
      {
         return _editable;
      }
      
      public function set editable(param1:Boolean) : void
      {
         _editable = param1;
         updateTextFieldType();
      }
      
      public function get horizontalScrollPosition() : int
      {
         return textField.scrollH;
      }
      
      public function set horizontalScrollPosition(param1:int) : void
      {
         textField.scrollH = param1;
      }
      
      public function get maxHorizontalScrollPosition() : int
      {
         return textField.maxScrollH;
      }
      
      public function get length() : int
      {
         return textField.length;
      }
      
      [Inspectable(defaultValue="0")]
      public function get maxChars() : int
      {
         return textField.maxChars;
      }
      
      public function set maxChars(param1:int) : void
      {
         textField.maxChars = param1;
      }
      
      [Inspectable(defaultValue="false")]
      public function get displayAsPassword() : Boolean
      {
         return textField.displayAsPassword;
      }
      
      public function set displayAsPassword(param1:Boolean) : void
      {
         textField.displayAsPassword = param1;
      }
      
      [Inspectable(defaultValue="")]
      public function get restrict() : String
      {
         return textField.restrict;
      }
      
      public function set restrict(param1:String) : void
      {
         if(componentInspectorSetting && param1 == "")
         {
            param1 = null;
         }
         textField.restrict = param1;
      }
      
      public function get selectionBeginIndex() : int
      {
         return textField.selectionBeginIndex;
      }
      
      public function get selectionEndIndex() : int
      {
         return textField.selectionEndIndex;
      }
      
      public function get condenseWhite() : Boolean
      {
         return textField.condenseWhite;
      }
      
      public function set condenseWhite(param1:Boolean) : void
      {
         textField.condenseWhite = param1;
      }
      
      public function get htmlText() : String
      {
         return textField.htmlText;
      }
      
      public function set htmlText(param1:String) : void
      {
         if(param1 == "")
         {
            text = "";
            return;
         }
         _html = true;
         _savedHTML = param1;
         textField.htmlText = param1;
         invalidate(InvalidationType.DATA);
         invalidate(InvalidationType.STYLES);
      }
      
      public function get textHeight() : Number
      {
         return textField.textHeight;
      }
      
      public function get textWidth() : Number
      {
         return textField.textWidth;
      }
      
      public function setSelection(param1:int, param2:int) : void
      {
         textField.setSelection(param1,param2);
      }
      
      public function getLineMetrics(param1:int) : TextLineMetrics
      {
         return textField.getLineMetrics(param1);
      }
      
      public function appendText(param1:String) : void
      {
         textField.appendText(param1);
      }
      
      protected function updateTextFieldType() : void
      {
         textField.type = enabled && editable?TextFieldType.INPUT:TextFieldType.DYNAMIC;
         textField.selectable = enabled;
      }
      
      protected function handleKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            dispatchEvent(new ComponentEvent(ComponentEvent.ENTER,true));
         }
      }
      
      protected function handleChange(param1:Event) : void
      {
         param1.stopPropagation();
         dispatchEvent(new Event(Event.CHANGE,true));
      }
      
      protected function handleTextInput(param1:TextEvent) : void
      {
         param1.stopPropagation();
         dispatchEvent(new TextEvent(TextEvent.TEXT_INPUT,true,false,param1.text));
      }
      
      protected function setEmbedFont() : *
      {
         var _loc1_:Object = getStyleValue("embedFonts");
         if(_loc1_ != null)
         {
            textField.embedFonts = _loc1_;
         }
      }
      
      override protected function draw() : void
      {
         var _loc1_:Object = null;
         if(isInvalid(InvalidationType.STYLES,InvalidationType.STATE))
         {
            drawTextFormat();
            drawBackground();
            _loc1_ = getStyleValue("embedFonts");
            if(_loc1_ != null)
            {
               textField.embedFonts = _loc1_;
            }
            invalidate(InvalidationType.SIZE,false);
         }
         if(isInvalid(InvalidationType.SIZE))
         {
            drawLayout();
         }
         super.draw();
      }
      
      protected function drawBackground() : void
      {
         var _loc1_:DisplayObject = background;
         var _loc2_:String = !!enabled?"upSkin":"disabledSkin";
         background = getDisplayObjectInstance(getStyleValue(_loc2_));
         if(background == null)
         {
            return;
         }
         addChildAt(background,0);
         if(_loc1_ != null && _loc1_ != background && contains(_loc1_))
         {
            removeChild(_loc1_);
         }
      }
      
      protected function drawTextFormat() : void
      {
         var _loc1_:Object = UIComponent.getStyleDefinition();
         var _loc2_:TextFormat = !!enabled?_loc1_.defaultTextFormat as TextFormat:_loc1_.defaultDisabledTextFormat as TextFormat;
         textField.setTextFormat(_loc2_);
         var _loc3_:TextFormat = getStyleValue(!!enabled?"textFormat":"disabledTextFormat") as TextFormat;
         if(_loc3_ != null)
         {
            textField.setTextFormat(_loc3_);
         }
         else
         {
            _loc3_ = _loc2_;
         }
         textField.defaultTextFormat = _loc3_;
         setEmbedFont();
         if(_html)
         {
            textField.htmlText = _savedHTML;
         }
      }
      
      protected function drawLayout() : void
      {
         var _loc1_:Number = Number(getStyleValue("textPadding"));
         if(background != null)
         {
            background.width = width;
            background.height = height;
         }
         textField.width = width - 2 * _loc1_;
         textField.height = height - 2 * _loc1_;
         textField.x = textField.y = _loc1_;
      }
      
      override protected function configUI() : void
      {
         super.configUI();
         tabChildren = true;
         textField = new TextField();
         addChild(textField);
         updateTextFieldType();
         textField.addEventListener(TextEvent.TEXT_INPUT,handleTextInput,false,0,true);
         textField.addEventListener(Event.CHANGE,handleChange,false,0,true);
         textField.addEventListener(KeyboardEvent.KEY_DOWN,handleKeyDown,false,0,true);
      }
      
      override public function setFocus() : void
      {
         stage.focus = textField;
      }
      
      override protected function isOurFocus(param1:DisplayObject) : Boolean
      {
         return param1 == textField || super.isOurFocus(param1);
      }
      
      override protected function focusInHandler(param1:FocusEvent) : void
      {
         if(param1.target == this)
         {
            stage.focus = textField;
         }
         var _loc2_:IFocusManager = focusManager;
         if(editable && _loc2_)
         {
            _loc2_.showFocusIndicator = true;
            if(textField.selectable && textField.selectionBeginIndex == textField.selectionBeginIndex)
            {
               setSelection(0,textField.length);
            }
         }
         super.focusInHandler(param1);
         if(editable)
         {
            setIMEMode(true);
         }
      }
      
      override protected function focusOutHandler(param1:FocusEvent) : void
      {
         super.focusOutHandler(param1);
         if(editable)
         {
            setIMEMode(false);
         }
      }
   }
}
