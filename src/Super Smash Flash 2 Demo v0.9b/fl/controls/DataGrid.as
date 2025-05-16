package fl.controls
{
    import fl.managers.IFocusManagerComponent;
    import fl.controls.dataGridClasses.HeaderRenderer;
    import flash.display.Sprite;
    import flash.utils.Dictionary;
    import fl.events.DataGridEvent;
    import flash.events.MouseEvent;
    import fl.data.DataProvider;
    import fl.core.InvalidationType;
    import fl.controls.listClasses.ICellRenderer;
    import fl.controls.dataGridClasses.DataGridColumn;
    import flash.display.Graphics;
    import fl.core.UIComponent;
    import flash.display.DisplayObject;
    import flash.events.Event;
    import fl.controls.listClasses.ListData;
    import flash.geom.Point;
    import fl.events.DataGridEventReason;
    import flash.display.DisplayObjectContainer;
    import flash.ui.Mouse;
    import fl.managers.IFocusManager;
    import flash.display.InteractiveObject;
    import flash.utils.describeType;
    import flash.events.FocusEvent;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;
    import fl.events.DataChangeEvent;

    [Event(name="headerRelease", type="fl.events.DataGridEvent")]
    [Event(name="columnStretch", type="fl.events.DataGridEvent")]
    [Event(name="itemEditBeginning", type="fl.events.DataGridEvent")]
    [Event(name="itemEditBegin", type="fl.events.DataGridEvent")]
    [Event(name="itemEditEnd", type="fl.events.DataGridEvent")]
    [Event(name="itemFocusIn", type="fl.events.DataGridEvent")]
    [Event(name="itemFocusOut", type="fl.events.DataGridEvent")]
    [Style(name="columnStretchCursorSkin", type="Class")]
    [Style(name="columnDividerSkin", type="Class")]
    [Style(name="headerUpSkin", type="Class")]
    [Style(name="headerOverSkin", type="Class")]
    [Style(name="headerDownSkin", type="Class")]
    [Style(name="headerDisabledSkin", type="Class")]
    [Style(name="headerSortArrowDescSkin", type="Class")]
    [Style(name="headerSortArrowAscSkin", type="Class")]
    [Style(name="headerTextFormat", type="flash.text.TextFormat")]
    [Style(name="headerDisabledTextFormat", type="flash.text.TextFormat")]
    [Style(name="headerTextPadding", type="Number", format="Length")]
    [Style(name="headerRenderer", type="Class")]
    [InspectableList("allowMultipleSelection", "editable", "headerHeight", "horizontalLineScrollSize", "horizontalPageScrollSize", "horizontalScrollPolicy", "resizableColumns", "rowHeight", "showHeaders", "sortableColumns", "verticalLineScrollSize", "verticalPageScrollSize", "verticalScrollPolicy")]
    public class DataGrid extends SelectableList implements IFocusManagerComponent 
    {

        private static var defaultStyles:Object = {
            "headerUpSkin":"HeaderRenderer_upSkin",
            "headerDownSkin":"HeaderRenderer_downSkin",
            "headerOverSkin":"HeaderRenderer_overSkin",
            "headerDisabledSkin":"HeaderRenderer_disabledSkin",
            "headerSortArrowDescSkin":"HeaderSortArrow_descIcon",
            "headerSortArrowAscSkin":"HeaderSortArrow_ascIcon",
            "columnStretchCursorSkin":"ColumnStretch_cursor",
            "columnDividerSkin":null,
            "headerTextFormat":null,
            "headerDisabledTextFormat":null,
            "headerTextPadding":5,
            "headerRenderer":HeaderRenderer,
            "focusRectSkin":null,
            "focusRectPadding":null,
            "skin":"DataGrid_skin"
        };
        protected static const HEADER_STYLES:Object = {
            "disabledSkin":"headerDisabledSkin",
            "downSkin":"headerDownSkin",
            "overSkin":"headerOverSkin",
            "upSkin":"headerUpSkin",
            "textFormat":"headerTextFormat",
            "disabledTextFormat":"headerDisabledTextFormat",
            "textPadding":"headerTextPadding"
        };
        public static var createAccessibilityImplementation:Function;

        protected var _rowHeight:Number = 20;
        protected var _headerHeight:Number = 25;
        protected var _showHeaders:Boolean = true;
        protected var _columns:Array;
        protected var _minColumnWidth:Number;
        protected var header:Sprite;
        protected var headerMask:Sprite;
        protected var headerSortArrow:Sprite;
        protected var _cellRenderer:Object;
        protected var _headerRenderer:Object;
        protected var _labelFunction:Function;
        protected var visibleColumns:Array;
        protected var displayableColumns:Array;
        protected var columnsInvalid:Boolean = true;
        protected var minColumnWidthInvalid:Boolean = false;
        protected var activeCellRenderersMap:Dictionary;
        protected var availableCellRenderersMap:Dictionary;
        protected var dragHandlesMap:Dictionary;
        protected var columnStretchIndex:Number = -1;
        protected var columnStretchStartX:Number;
        protected var columnStretchStartWidth:Number;
        protected var columnStretchCursor:Sprite;
        protected var _sortIndex:int = -1;
        protected var lastSortIndex:int = -1;
        protected var _sortDescending:Boolean = false;
        protected var _editedItemPosition:Object;
        protected var editedItemPositionChanged:Boolean = false;
        protected var proposedEditedItemPosition:*;
        protected var actualRowIndex:int;
        protected var actualColIndex:int;
        protected var isPressed:Boolean = false;
        protected var losingFocus:Boolean = false;
        protected var maxHeaderHeight:Number = 25;
        protected var currentHoveredRow:int = -1;
        [Inspectable(defaultValue="false")]
        public var editable:Boolean = false;
        [Inspectable(defaultValue="true")]
        public var resizableColumns:Boolean = true;
        [Inspectable(defaultValue="true")]
        public var sortableColumns:Boolean = true;
        public var itemEditorInstance:Object;

        public function DataGrid()
        {
            if (_columns == null)
            {
                _columns = [];
            };
            _horizontalScrollPolicy = ScrollPolicy.OFF;
            activeCellRenderersMap = new Dictionary(true);
            availableCellRenderersMap = new Dictionary(true);
            addEventListener(DataGridEvent.ITEM_EDIT_BEGINNING, itemEditorItemEditBeginningHandler, false, -50);
            addEventListener(DataGridEvent.ITEM_EDIT_BEGIN, itemEditorItemEditBeginHandler, false, -50);
            addEventListener(DataGridEvent.ITEM_EDIT_END, itemEditorItemEditEndHandler, false, -50);
            addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
            addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        }

        public static function getStyleDefinition():Object
        {
            return (mergeStyles(defaultStyles, SelectableList.getStyleDefinition(), ScrollBar.getStyleDefinition()));
        }


        override public function set dataProvider(_arg_1:DataProvider):void
        {
            super.dataProvider = _arg_1;
            if (_columns == null)
            {
                _columns = [];
            };
            if (_columns.length == 0)
            {
                createColumnsFromDataProvider();
            };
            removeCellRenderers();
        }

        [Inspectable(defaultValue="true", verbose="1")]
        override public function set enabled(_arg_1:Boolean):void
        {
            super.enabled = _arg_1;
            header.mouseChildren = _enabled;
        }

        override public function setSize(_arg_1:Number, _arg_2:Number):void
        {
            super.setSize(_arg_1, _arg_2);
            columnsInvalid = true;
        }

        [Inspectable(defaultValue="off", enumeration="on,off,auto")]
        override public function get horizontalScrollPolicy():String
        {
            return (_horizontalScrollPolicy);
        }

        override public function set horizontalScrollPolicy(_arg_1:String):void
        {
            super.horizontalScrollPolicy = _arg_1;
            columnsInvalid = true;
        }

        public function get columns():Array
        {
            return (_columns.slice(0));
        }

        public function set columns(_arg_1:Array):void
        {
            removeCellRenderers();
            _columns = [];
            var _local_2:uint;
            while (_local_2 < _arg_1.length)
            {
                addColumn(_arg_1[_local_2]);
                _local_2++;
            };
        }

        public function get minColumnWidth():Number
        {
            return (_minColumnWidth);
        }

        public function set minColumnWidth(_arg_1:Number):void
        {
            _minColumnWidth = _arg_1;
            columnsInvalid = true;
            minColumnWidthInvalid = true;
            invalidate(InvalidationType.SIZE);
        }

        public function get labelFunction():Function
        {
            return (_labelFunction);
        }

        public function set labelFunction(_arg_1:Function):void
        {
            if (_labelFunction == _arg_1)
            {
                return;
            };
            _labelFunction = _arg_1;
            invalidate(InvalidationType.DATA);
        }

        override public function get rowCount():uint
        {
            return (Math.ceil((calculateAvailableHeight() / rowHeight)));
        }

        public function set rowCount(_arg_1:uint):void
        {
            var _local_2:Number = Number(getStyleValue("contentPadding"));
            var _local_3:Number = (((_horizontalScrollPolicy == ScrollPolicy.ON) || ((_horizontalScrollPolicy == ScrollPolicy.AUTO) && (hScrollBar))) ? 15 : 0);
            height = ((((rowHeight * _arg_1) + (2 * _local_2)) + _local_3) + ((showHeaders) ? headerHeight : 0));
        }

        [Inspectable(defaultValue="20")]
        public function get rowHeight():Number
        {
            return (_rowHeight);
        }

        public function set rowHeight(_arg_1:Number):void
        {
            _rowHeight = Math.max(0, _arg_1);
            invalidate(InvalidationType.SIZE);
        }

        [Inspectable(defaultValue="25")]
        public function get headerHeight():Number
        {
            return (_headerHeight);
        }

        public function set headerHeight(_arg_1:Number):void
        {
            maxHeaderHeight = _arg_1;
            _headerHeight = Math.max(0, _arg_1);
            invalidate(InvalidationType.SIZE);
        }

        [Inspectable(defaultValue="true")]
        public function get showHeaders():Boolean
        {
            return (_showHeaders);
        }

        public function set showHeaders(_arg_1:Boolean):void
        {
            _showHeaders = _arg_1;
            invalidate(InvalidationType.SIZE);
        }

        public function get sortIndex():int
        {
            return (_sortIndex);
        }

        public function get sortDescending():Boolean
        {
            return (_sortDescending);
        }

        public function get imeMode():String
        {
            return (_imeMode);
        }

        public function set imeMode(_arg_1:String):void
        {
            _imeMode = _arg_1;
        }

        public function get editedItemRenderer():ICellRenderer
        {
            if ((!(itemEditorInstance)))
            {
                return (null);
            };
            return (getCellRendererAt(actualRowIndex, actualColIndex));
        }

        public function get editedItemPosition():Object
        {
            if (_editedItemPosition)
            {
                return ({
                    "rowIndex":_editedItemPosition.rowIndex,
                    "columnIndex":_editedItemPosition.columnIndex
                });
            };
            return (_editedItemPosition);
        }

        public function set editedItemPosition(_arg_1:Object):void
        {
            var _local_2:Object = {
                "rowIndex":_arg_1.rowIndex,
                "columnIndex":_arg_1.columnIndex
            };
            setEditedItemPosition(_local_2);
        }

        protected function calculateAvailableHeight():Number
        {
            var _local_1:Number = Number(getStyleValue("contentPadding"));
            var _local_2:Number = (((_horizontalScrollPolicy == ScrollPolicy.ON) || ((_horizontalScrollPolicy == ScrollPolicy.AUTO) && (_maxHorizontalScrollPosition > 0))) ? 15 : 0);
            return (((height - (_local_1 * 2)) - _local_2) - ((showHeaders) ? headerHeight : 0));
        }

        public function addColumn(_arg_1:*):DataGridColumn
        {
            return (addColumnAt(_arg_1, _columns.length));
        }

        public function addColumnAt(_arg_1:*, _arg_2:uint):DataGridColumn
        {
            var _local_3:DataGridColumn;
            var _local_5:uint;
            if (_arg_2 < _columns.length)
            {
                _columns.splice(_arg_2, 0, "");
                _local_5 = (_arg_2 + 1);
                while (_local_5 < _columns.length)
                {
                    _local_3 = (_columns[_local_5] as DataGridColumn);
                    _local_3.colNum = _local_5;
                    _local_5++;
                };
            };
            var _local_4:* = _arg_1;
            if ((!(_local_4 is DataGridColumn)))
            {
                if ((_local_4 is String))
                {
                    _local_4 = new DataGridColumn(_local_4);
                }
                else
                {
                    _local_4 = new DataGridColumn();
                };
            };
            _local_3 = (_local_4 as DataGridColumn);
            _local_3.owner = this;
            _local_3.colNum = _arg_2;
            _columns[_arg_2] = _local_3;
            invalidate(InvalidationType.SIZE);
            columnsInvalid = true;
            return (_local_3);
        }

        public function removeColumnAt(_arg_1:uint):DataGridColumn
        {
            var _local_3:uint;
            var _local_2:DataGridColumn = (_columns[_arg_1] as DataGridColumn);
            if (_local_2 != null)
            {
                removeCellRenderersByColumn(_local_2);
                _columns.splice(_arg_1, 1);
                _local_3 = _arg_1;
                while (_local_3 < _columns.length)
                {
                    _local_2 = (_columns[_local_3] as DataGridColumn);
                    if (_local_2)
                    {
                        _local_2.colNum = _local_3;
                    };
                    _local_3++;
                };
                invalidate(InvalidationType.SIZE);
                columnsInvalid = true;
            };
            return (_local_2);
        }

        public function removeAllColumns():void
        {
            if (_columns.length > 0)
            {
                removeCellRenderers();
                _columns = [];
                invalidate(InvalidationType.SIZE);
                columnsInvalid = true;
            };
        }

        public function getColumnAt(_arg_1:uint):DataGridColumn
        {
            return (_columns[_arg_1] as DataGridColumn);
        }

        public function getColumnIndex(_arg_1:String):int
        {
            var _local_3:DataGridColumn;
            var _local_2:uint;
            while (_local_2 < _columns.length)
            {
                _local_3 = (_columns[_local_2] as DataGridColumn);
                if (_local_3.dataField == _arg_1)
                {
                    return (_local_2);
                };
                _local_2++;
            };
            return (-1);
        }

        public function getColumnCount():uint
        {
            return (_columns.length);
        }

        public function spaceColumnsEqually():void
        {
            var _local_1:Number;
            var _local_2:int;
            var _local_3:DataGridColumn;
            drawNow();
            if (displayableColumns.length > 0)
            {
                _local_1 = (availableWidth / displayableColumns.length);
                _local_2 = 0;
                while (_local_2 < displayableColumns.length)
                {
                    _local_3 = (displayableColumns[_local_2] as DataGridColumn);
                    _local_3.width = _local_1;
                    _local_2++;
                };
                invalidate(InvalidationType.SIZE);
                columnsInvalid = true;
            };
        }

        public function editField(_arg_1:uint, _arg_2:String, _arg_3:Object):void
        {
            var _local_4:Object = getItemAt(_arg_1);
            _local_4[_arg_2] = _arg_3;
            replaceItemAt(_local_4, _arg_1);
        }

        override public function itemToCellRenderer(_arg_1:Object):ICellRenderer
        {
            return (null);
        }

        override protected function configUI():void
        {
            useFixedHorizontalScrolling = false;
            super.configUI();
            headerMask = new Sprite();
            var _local_1:Graphics = headerMask.graphics;
            _local_1.beginFill(0, 0.3);
            _local_1.drawRect(0, 0, 100, 100);
            _local_1.endFill();
            headerMask.visible = false;
            addChild(headerMask);
            header = new Sprite();
            addChild(header);
            header.mask = headerMask;
            _horizontalScrollPolicy = ScrollPolicy.OFF;
            _verticalScrollPolicy = ScrollPolicy.AUTO;
        }

        override protected function draw():void
        {
            var _local_1:Boolean = (!(contentHeight == (rowHeight * length)));
            contentHeight = (rowHeight * length);
            if (isInvalid(InvalidationType.STYLES))
            {
                setStyles();
                drawBackground();
                if (contentPadding != getStyleValue("contentPadding"))
                {
                    invalidate(InvalidationType.SIZE, false);
                };
                if (((!(_cellRenderer == getStyleValue("cellRenderer"))) || (!(_headerRenderer == getStyleValue("headerRenderer")))))
                {
                    _invalidateList();
                    _cellRenderer = getStyleValue("cellRenderer");
                    _headerRenderer = getStyleValue("headerRenderer");
                };
            };
            if (isInvalid(InvalidationType.SIZE))
            {
                columnsInvalid = true;
            };
            if (((isInvalid(InvalidationType.SIZE, InvalidationType.STATE)) || (_local_1)))
            {
                drawLayout();
                drawDisabledOverlay();
            };
            if (isInvalid(InvalidationType.RENDERER_STYLES))
            {
                updateRendererStyles();
            };
            if (isInvalid(InvalidationType.STYLES, InvalidationType.SIZE, InvalidationType.DATA, InvalidationType.SCROLL, InvalidationType.SELECTED))
            {
                drawList();
            };
            updateChildren();
            validate();
        }

        override protected function drawLayout():void
        {
            vOffset = ((showHeaders) ? headerHeight : 0);
            super.drawLayout();
            contentScrollRect = listHolder.scrollRect;
            if (showHeaders)
            {
                headerHeight = maxHeaderHeight;
                if (Math.floor((availableHeight - headerHeight)) <= 0)
                {
                    _headerHeight = availableHeight;
                };
                list.y = headerHeight;
                contentScrollRect = listHolder.scrollRect;
                contentScrollRect.y = (contentPadding + headerHeight);
                contentScrollRect.height = (availableHeight - headerHeight);
                listHolder.y = (contentPadding + headerHeight);
                headerMask.x = contentPadding;
                headerMask.y = contentPadding;
                headerMask.width = availableWidth;
                headerMask.height = headerHeight;
            }
            else
            {
                contentScrollRect.y = contentPadding;
                listHolder.y = 0;
            };
            listHolder.scrollRect = contentScrollRect;
        }

        override protected function drawList():void
        {
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:uint;
            var _local_6:Object;
            var _local_7:ICellRenderer;
            var _local_8:Array;
            var _local_9:DataGridColumn;
            var _local_13:Sprite;
            var _local_14:UIComponent;
            var _local_18:Number;
            var _local_19:DataGridColumn;
            var _local_20:Object;
            var _local_21:Array;
            var _local_22:Dictionary;
            var _local_23:Object;
            var _local_24:HeaderRenderer;
            var _local_25:Sprite;
            var _local_26:Graphics;
            var _local_27:Boolean;
            var _local_28:String;
            if (showHeaders)
            {
                header.visible = true;
                header.x = (contentPadding - _horizontalScrollPosition);
                header.y = contentPadding;
                listHolder.y = (contentPadding + headerHeight);
                _local_18 = Math.floor((availableHeight - headerHeight));
                _verticalScrollBar.setScrollProperties(_local_18, 0, (contentHeight - _local_18), _verticalScrollBar.pageScrollSize);
            }
            else
            {
                header.visible = false;
                listHolder.y = contentPadding;
            };
            listHolder.x = contentPadding;
            contentScrollRect = listHolder.scrollRect;
            contentScrollRect.x = _horizontalScrollPosition;
            contentScrollRect.y = (vOffset + (Math.floor(_verticalScrollPosition) % rowHeight));
            listHolder.scrollRect = contentScrollRect;
            listHolder.cacheAsBitmap = useBitmapScrolling;
            var _local_1:uint = uint(Math.min(Math.max((length - 1), 0), Math.floor((_verticalScrollPosition / rowHeight))));
            var _local_2:uint = Math.min(Math.max((length - 1), 0), ((_local_1 + rowCount) + 1));
            var _local_10:Boolean = list.hitTestPoint(stage.mouseX, stage.mouseY);
            calculateColumnSizes();
            var _local_11:Dictionary = (renderedItems = new Dictionary(true));
            if (length > 0)
            {
                _local_5 = _local_1;
                while (_local_5 <= _local_2)
                {
                    _local_11[_dataProvider.getItemAt(_local_5)] = true;
                    _local_5++;
                };
            };
            _local_3 = 0;
            var _local_12:DataGridColumn = (visibleColumns[0] as DataGridColumn);
            _local_5 = 0;
            while (_local_5 < displayableColumns.length)
            {
                _local_19 = (displayableColumns[_local_5] as DataGridColumn);
                if (_local_19 != _local_12)
                {
                    _local_3 = (_local_3 + _local_19.width);
                }
                else
                {
                    break;
                };
                _local_5++;
            };
            while (header.numChildren > 0)
            {
                header.removeChildAt(0);
            };
            dragHandlesMap = new Dictionary(true);
            var _local_15:Array = [];
            var _local_16:uint = visibleColumns.length;
            var _local_17:uint;
            while (_local_17 < _local_16)
            {
                _local_9 = (visibleColumns[_local_17] as DataGridColumn);
                _local_15.push(_local_9.colNum);
                if (showHeaders)
                {
                    _local_23 = ((_local_9.headerRenderer != null) ? _local_9.headerRenderer : _headerRenderer);
                    _local_24 = (getDisplayObjectInstance(_local_23) as HeaderRenderer);
                    if (_local_24 != null)
                    {
                        _local_24.addEventListener(MouseEvent.CLICK, handleHeaderRendererClick, false, 0, true);
                        _local_24.x = _local_3;
                        _local_24.y = 0;
                        _local_24.setSize(_local_9.width, headerHeight);
                        _local_24.column = _local_9.colNum;
                        _local_24.label = _local_9.headerText;
                        header.addChildAt(_local_24, _local_17);
                        copyStylesToChild(_local_24, HEADER_STYLES);
                        if ((((sortIndex == -1) && (lastSortIndex == -1)) || (!(_local_9.colNum == sortIndex))))
                        {
                            _local_24.setStyle("icon", null);
                        }
                        else
                        {
                            _local_24.setStyle("icon", ((sortDescending) ? getStyleValue("headerSortArrowAscSkin") : getStyleValue("headerSortArrowDescSkin")));
                        };
                        if ((((_local_17 < (_local_16 - 1)) && (resizableColumns)) && (_local_9.resizable)))
                        {
                            _local_25 = new Sprite();
                            _local_26 = _local_25.graphics;
                            _local_26.beginFill(0, 0);
                            _local_26.drawRect(0, 0, 3, headerHeight);
                            _local_26.endFill();
                            _local_25.x = ((_local_3 + _local_9.width) - 2);
                            _local_25.y = 0;
                            _local_25.alpha = 0;
                            _local_25.addEventListener(MouseEvent.MOUSE_OVER, handleHeaderResizeOver, false, 0, true);
                            _local_25.addEventListener(MouseEvent.MOUSE_OUT, handleHeaderResizeOut, false, 0, true);
                            _local_25.addEventListener(MouseEvent.MOUSE_DOWN, handleHeaderResizeDown, false, 0, true);
                            header.addChild(_local_25);
                            dragHandlesMap[_local_25] = _local_9.colNum;
                        };
                        if ((((_local_17 == (_local_16 - 1)) && (_horizontalScrollPosition == 0)) && (availableWidth > (_local_3 + _local_9.width))))
                        {
                            _local_4 = Math.floor((availableWidth - _local_3));
                            _local_24.setSize(_local_4, headerHeight);
                        }
                        else
                        {
                            _local_4 = _local_9.width;
                        };
                        _local_24.drawNow();
                    };
                };
                _local_20 = ((_local_9.cellRenderer != null) ? _local_9.cellRenderer : _cellRenderer);
                _local_21 = availableCellRenderersMap[_local_9];
                _local_8 = activeCellRenderersMap[_local_9];
                if (_local_8 == null)
                {
                    activeCellRenderersMap[_local_9] = (_local_8 = []);
                };
                if (_local_21 == null)
                {
                    availableCellRenderersMap[_local_9] = (_local_21 = []);
                };
                _local_22 = new Dictionary(true);
                while (_local_8.length > 0)
                {
                    _local_7 = _local_8.pop();
                    _local_6 = _local_7.data;
                    if (((_local_11[_local_6] == null) || (invalidItems[_local_6] == true)))
                    {
                        _local_21.push(_local_7);
                    }
                    else
                    {
                        _local_22[_local_6] = _local_7;
                        invalidItems[_local_6] = true;
                    };
                    list.removeChild((_local_7 as DisplayObject));
                };
                if (length > 0)
                {
                    _local_5 = _local_1;
                    while (_local_5 <= _local_2)
                    {
                        _local_27 = false;
                        _local_6 = _dataProvider.getItemAt(_local_5);
                        if (_local_22[_local_6] != null)
                        {
                            _local_27 = true;
                            _local_7 = _local_22[_local_6];
                            delete _local_22[_local_6];
                        }
                        else
                        {
                            if (_local_21.length > 0)
                            {
                                _local_7 = (_local_21.pop() as ICellRenderer);
                            }
                            else
                            {
                                _local_7 = (getDisplayObjectInstance(_local_20) as ICellRenderer);
                                _local_13 = (_local_7 as Sprite);
                                if (_local_13 != null)
                                {
                                    _local_13.addEventListener(MouseEvent.CLICK, handleCellRendererClick, false, 0, true);
                                    _local_13.addEventListener(MouseEvent.ROLL_OVER, handleCellRendererMouseEvent, false, 0, true);
                                    _local_13.addEventListener(MouseEvent.ROLL_OUT, handleCellRendererMouseEvent, false, 0, true);
                                    _local_13.addEventListener(Event.CHANGE, handleCellRendererChange, false, 0, true);
                                    _local_13.doubleClickEnabled = true;
                                    _local_13.addEventListener(MouseEvent.DOUBLE_CLICK, handleCellRendererDoubleClick, false, 0, true);
                                    if (_local_13["setStyle"] != null)
                                    {
                                        for (_local_28 in rendererStyles)
                                        {
                                            var _local_31:* = _local_13;
                                            (_local_31["setStyle"](_local_28, rendererStyles[_local_28]));
                                        };
                                    };
                                };
                            };
                        };
                        list.addChild((_local_7 as Sprite));
                        _local_8.push(_local_7);
                        _local_7.x = _local_3;
                        _local_7.y = (rowHeight * (_local_5 - _local_1));
                        _local_7.setSize(((_local_17 == (_local_16 - 1)) ? _local_4 : _local_9.width), rowHeight);
                        if ((!(_local_27)))
                        {
                            _local_7.data = _local_6;
                        };
                        _local_7.listData = new ListData(columnItemToLabel(_local_9.colNum, _local_6), null, this, _local_5, _local_5, _local_9.colNum);
                        if (((_local_10) && (isHovered(_local_7))))
                        {
                            _local_7.setMouseState("over");
                            currentHoveredRow = _local_5;
                        }
                        else
                        {
                            _local_7.setMouseState("up");
                        };
                        _local_7.selected = (!(_selectedIndices.indexOf(_local_5) == -1));
                        if ((_local_7 is UIComponent))
                        {
                            _local_14 = (_local_7 as UIComponent);
                            _local_14.drawNow();
                        };
                        _local_5++;
                    };
                };
                _local_3 = (_local_3 + _local_9.width);
                _local_17++;
            };
            _local_5 = 0;
            while (_local_5 < _columns.length)
            {
                if (_local_15.indexOf(_local_5) == -1)
                {
                    removeCellRenderersByColumn((_columns[_local_5] as DataGridColumn));
                };
                _local_5++;
            };
            if (editedItemPositionChanged)
            {
                editedItemPositionChanged = false;
                commitEditedItemPosition(proposedEditedItemPosition);
                proposedEditedItemPosition = undefined;
            };
            invalidItems = new Dictionary(true);
        }

        override protected function updateRendererStyles():void
        {
            var _local_2:Object;
            var _local_3:uint;
            var _local_4:uint;
            var _local_5:String;
            var _local_1:Array = [];
            for (_local_2 in availableCellRenderersMap)
            {
                _local_1 = _local_1.concat(availableCellRenderersMap[_local_2]);
            };
            for (_local_2 in activeCellRenderersMap)
            {
                _local_1 = _local_1.concat(activeCellRenderersMap[_local_2]);
            };
            _local_3 = _local_1.length;
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                if (_local_1[_local_4]["setStyle"] != null)
                {
                    for (_local_5 in updatedRendererStyles)
                    {
                        _local_1[_local_4].setStyle(_local_5, updatedRendererStyles[_local_5]);
                    };
                    _local_1[_local_4].drawNow();
                };
                _local_4++;
            };
            updatedRendererStyles = {};
        }

        protected function removeCellRenderers():void
        {
            var _local_1:uint;
            while (_local_1 < _columns.length)
            {
                removeCellRenderersByColumn((_columns[_local_1] as DataGridColumn));
                _local_1++;
            };
        }

        protected function removeCellRenderersByColumn(_arg_1:DataGridColumn):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:Array = activeCellRenderersMap[_arg_1];
            if (_local_2 != null)
            {
                while (_local_2.length > 0)
                {
                    list.removeChild((_local_2.pop() as DisplayObject));
                };
            };
        }

        override protected function handleCellRendererMouseEvent(_arg_1:MouseEvent):void
        {
            var _local_3:int;
            var _local_4:String;
            var _local_5:uint;
            var _local_6:DataGridColumn;
            var _local_7:ICellRenderer;
            var _local_2:ICellRenderer = (_arg_1.target as ICellRenderer);
            if (_local_2)
            {
                _local_3 = _local_2.listData.row;
                if (_arg_1.type == MouseEvent.ROLL_OVER)
                {
                    _local_4 = "over";
                }
                else
                {
                    if (_arg_1.type == MouseEvent.ROLL_OUT)
                    {
                        _local_4 = "up";
                    };
                };
                if (_local_4)
                {
                    _local_5 = 0;
                    while (_local_5 < visibleColumns.length)
                    {
                        _local_6 = (visibleColumns[_local_5] as DataGridColumn);
                        _local_7 = getCellRendererAt(_local_3, _local_6.colNum);
                        if (_local_7)
                        {
                            _local_7.setMouseState(_local_4);
                        };
                        if (_local_3 != currentHoveredRow)
                        {
                            _local_7 = getCellRendererAt(currentHoveredRow, _local_6.colNum);
                            if (_local_7)
                            {
                                _local_7.setMouseState("up");
                            };
                        };
                        _local_5++;
                    };
                };
            };
            super.handleCellRendererMouseEvent(_arg_1);
        }

        protected function isHovered(_arg_1:ICellRenderer):Boolean
        {
            var _local_2:uint = uint(Math.min(Math.max((length - 1), 0), Math.floor((_verticalScrollPosition / rowHeight))));
            var _local_3:Number = ((_arg_1.listData.row - _local_2) * rowHeight);
            var _local_4:Point = list.globalToLocal(new Point(0, stage.mouseY));
            return ((_local_4.y > _local_3) && (_local_4.y < (_local_3 + rowHeight)));
        }

        override protected function setHorizontalScrollPosition(_arg_1:Number, _arg_2:Boolean=false):void
        {
            if (_arg_1 == _horizontalScrollPosition)
            {
                return;
            };
            contentScrollRect = listHolder.scrollRect;
            contentScrollRect.x = _arg_1;
            listHolder.scrollRect = contentScrollRect;
            list.x = 0;
            header.x = -(_arg_1);
            super.setHorizontalScrollPosition(_arg_1, true);
            invalidate(InvalidationType.SCROLL);
            columnsInvalid = true;
        }

        override protected function setVerticalScrollPosition(_arg_1:Number, _arg_2:Boolean=false):void
        {
            if (itemEditorInstance)
            {
                endEdit(DataGridEventReason.OTHER);
            };
            invalidate(InvalidationType.SCROLL);
            super.setVerticalScrollPosition(_arg_1, true);
        }

        public function columnItemToLabel(_arg_1:uint, _arg_2:Object):String
        {
            var _local_3:DataGridColumn = (_columns[_arg_1] as DataGridColumn);
            if (_local_3 != null)
            {
                return (_local_3.itemToLabel(_arg_2));
            };
            return (" ");
        }

        protected function calculateColumnSizes():void
        {
            var _local_1:Number;
            var _local_2:int;
            var _local_3:int;
            var _local_5:DataGridColumn;
            var _local_6:DataGridColumn;
            var _local_7:Number;
            var _local_8:int;
            var _local_9:Number;
            var _local_10:int;
            var _local_11:Number;
            var _local_12:Number;
            var _local_13:Number;
            var _local_14:Number;
            var _local_4:Number = 0;
            if (_columns.length == 0)
            {
                visibleColumns = [];
                displayableColumns = [];
                return;
            };
            if (columnsInvalid)
            {
                columnsInvalid = false;
                visibleColumns = [];
                if (minColumnWidthInvalid)
                {
                    _local_2 = _columns.length;
                    _local_3 = 0;
                    while (_local_3 < _local_2)
                    {
                        _columns[_local_3].minWidth = minColumnWidth;
                        _local_3++;
                    };
                    minColumnWidthInvalid = false;
                };
                displayableColumns = null;
                _local_2 = _columns.length;
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    if (((displayableColumns) && (_columns[_local_3].visible)))
                    {
                        displayableColumns.push(_columns[_local_3]);
                    }
                    else
                    {
                        if (((!(displayableColumns)) && (!(_columns[_local_3].visible))))
                        {
                            displayableColumns = new Array(_local_3);
                            _local_8 = 0;
                            while (_local_8 < _local_3)
                            {
                                displayableColumns[_local_8] = _columns[_local_8];
                                _local_8++;
                            };
                        };
                    };
                    _local_3++;
                };
                if ((!(displayableColumns)))
                {
                    displayableColumns = _columns;
                };
                if (horizontalScrollPolicy == ScrollPolicy.OFF)
                {
                    _local_2 = displayableColumns.length;
                    _local_3 = 0;
                    while (_local_3 < _local_2)
                    {
                        visibleColumns.push(displayableColumns[_local_3]);
                        _local_3++;
                    };
                }
                else
                {
                    _local_2 = displayableColumns.length;
                    _local_9 = 0;
                    _local_3 = 0;
                    while (_local_3 < _local_2)
                    {
                        _local_5 = (displayableColumns[_local_3] as DataGridColumn);
                        if ((((_local_9 + _local_5.width) > _horizontalScrollPosition) && (_local_9 < (_horizontalScrollPosition + availableWidth))))
                        {
                            visibleColumns.push(_local_5);
                        };
                        _local_9 = (_local_9 + _local_5.width);
                        _local_3++;
                    };
                };
            };
            if (horizontalScrollPolicy == ScrollPolicy.OFF)
            {
                _local_10 = 0;
                _local_11 = 0;
                _local_2 = visibleColumns.length;
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    _local_5 = (visibleColumns[_local_3] as DataGridColumn);
                    if (_local_5.resizable)
                    {
                        if ((!(isNaN(_local_5.explicitWidth))))
                        {
                            _local_11 = (_local_11 + _local_5.width);
                        }
                        else
                        {
                            _local_10++;
                            _local_11 = (_local_11 + _local_5.minWidth);
                        };
                    }
                    else
                    {
                        _local_11 = (_local_11 + _local_5.width);
                    };
                    _local_4 = (_local_4 + _local_5.width);
                    _local_3++;
                };
                _local_13 = availableWidth;
                if (((availableWidth > _local_11) && (_local_10)))
                {
                    _local_2 = visibleColumns.length;
                    _local_3 = 0;
                    while (_local_3 < _local_2)
                    {
                        _local_5 = (visibleColumns[_local_3] as DataGridColumn);
                        if (((_local_5.resizable) && (isNaN(_local_5.explicitWidth))))
                        {
                            _local_6 = _local_5;
                            if (_local_4 > availableWidth)
                            {
                                _local_12 = ((_local_6.width - _local_6.minWidth) / (_local_4 - _local_11));
                            }
                            else
                            {
                                _local_12 = (_local_6.width / _local_4);
                            };
                            _local_7 = (_local_6.width - ((_local_4 - availableWidth) * _local_12));
                            _local_14 = _local_5.minWidth;
                            _local_5.setWidth(Math.max(_local_7, _local_14));
                        };
                        _local_13 = (_local_13 - _local_5.width);
                        _local_3++;
                    };
                    if (((_local_13) && (_local_6)))
                    {
                        _local_6.setWidth((_local_6.width + _local_13));
                    };
                }
                else
                {
                    _local_2 = visibleColumns.length;
                    _local_3 = 0;
                    while (_local_3 < _local_2)
                    {
                        _local_6 = (visibleColumns[_local_3] as DataGridColumn);
                        _local_12 = (_local_6.width / _local_4);
                        _local_7 = (availableWidth * _local_12);
                        _local_6.setWidth(_local_7);
                        _local_6.explicitWidth = NaN;
                        _local_13 = (_local_13 - _local_7);
                        _local_3++;
                    };
                    if (((_local_13) && (_local_6)))
                    {
                        _local_6.setWidth((_local_6.width + _local_13));
                    };
                };
            };
        }

        override protected function calculateContentWidth():void
        {
            var _local_1:int;
            var _local_2:int;
            var _local_3:DataGridColumn;
            if (_columns.length == 0)
            {
                contentWidth = 0;
                return;
            };
            if (minColumnWidthInvalid)
            {
                _local_1 = _columns.length;
                _local_2 = 0;
                while (_local_2 < _local_1)
                {
                    _local_3 = (_columns[_local_2] as DataGridColumn);
                    _local_3.minWidth = minColumnWidth;
                    _local_2++;
                };
                minColumnWidthInvalid = false;
            };
            if (horizontalScrollPolicy == ScrollPolicy.OFF)
            {
                contentWidth = availableWidth;
            }
            else
            {
                contentWidth = 0;
                _local_1 = _columns.length;
                _local_2 = 0;
                while (_local_2 < _local_1)
                {
                    _local_3 = (_columns[_local_2] as DataGridColumn);
                    if (_local_3.visible)
                    {
                        contentWidth = (contentWidth + _local_3.width);
                    };
                    _local_2++;
                };
                if (((!(isNaN(_horizontalScrollPosition))) && ((_horizontalScrollPosition + availableWidth) > contentWidth)))
                {
                    setHorizontalScrollPosition((contentWidth - availableWidth));
                };
            };
        }

        protected function handleHeaderRendererClick(_arg_1:MouseEvent):void
        {
            var _local_5:uint;
            var _local_6:DataGridEvent;
            if ((!(_enabled)))
            {
                return;
            };
            var _local_2:HeaderRenderer = (_arg_1.currentTarget as HeaderRenderer);
            var _local_3:uint = _local_2.column;
            var _local_4:DataGridColumn = (_columns[_local_3] as DataGridColumn);
            if (((sortableColumns) && (_local_4.sortable)))
            {
                _local_5 = _sortIndex;
                _sortIndex = _local_3;
                _local_6 = new DataGridEvent(DataGridEvent.HEADER_RELEASE, false, true, _local_3, -1, _local_2, ((_local_4) ? _local_4.dataField : null));
                if (((!(dispatchEvent(_local_6))) || (!(_selectable))))
                {
                    _sortIndex = lastSortIndex;
                    return;
                };
                lastSortIndex = _local_5;
                sortByColumn(_local_3);
                invalidate(InvalidationType.DATA);
            };
        }

        public function resizeColumn(_arg_1:int, _arg_2:Number):void
        {
            var _local_4:int;
            var _local_5:Number;
            var _local_6:int;
            var _local_7:DataGridColumn;
            var _local_8:DataGridColumn;
            var _local_9:int;
            var _local_10:Number;
            var _local_11:Number;
            var _local_12:Number;
            if (_columns.length == 0)
            {
                return;
            };
            var _local_3:DataGridColumn = (_columns[_arg_1] as DataGridColumn);
            if ((!(_local_3)))
            {
                return;
            };
            if (((!(visibleColumns)) || (visibleColumns.length == 0)))
            {
                _local_3.setWidth(_arg_2);
                return;
            };
            if (_arg_2 < _local_3.minWidth)
            {
                _arg_2 = _local_3.minWidth;
            };
            if (((_horizontalScrollPolicy == ScrollPolicy.ON) || (_horizontalScrollPolicy == ScrollPolicy.AUTO)))
            {
                _local_3.setWidth(_arg_2);
                _local_3.explicitWidth = _arg_2;
            }
            else
            {
                _local_4 = getVisibleColumnIndex(_local_3);
                if (_local_4 != -1)
                {
                    _local_5 = 0;
                    _local_6 = visibleColumns.length;
                    _local_9 = (_local_4 + 1);
                    while (_local_9 < _local_6)
                    {
                        _local_7 = (visibleColumns[_local_9] as DataGridColumn);
                        if (((_local_7) && (_local_7.resizable)))
                        {
                            _local_5 = (_local_5 + _local_7.width);
                        };
                        _local_9++;
                    };
                    _local_11 = ((_local_3.width - _arg_2) + _local_5);
                    if (_local_5)
                    {
                        _local_3.setWidth(_arg_2);
                        _local_3.explicitWidth = _arg_2;
                    };
                    _local_12 = 0;
                    _local_9 = (_local_4 + 1);
                    while (_local_9 < _local_6)
                    {
                        _local_7 = (visibleColumns[_local_9] as DataGridColumn);
                        if (_local_7.resizable)
                        {
                            _local_10 = ((_local_7.width * _local_11) / _local_5);
                            if (_local_10 < _local_7.minWidth)
                            {
                                _local_10 = _local_7.minWidth;
                            };
                            _local_7.setWidth(_local_10);
                            _local_12 = (_local_12 + _local_7.width);
                            _local_8 = _local_7;
                        };
                        _local_9++;
                    };
                    if (_local_12 > _local_11)
                    {
                        _local_10 = ((_local_3.width - _local_12) + _local_11);
                        if (_local_10 < _local_3.minWidth)
                        {
                            _local_10 = _local_3.minWidth;
                        };
                        _local_3.setWidth(_local_10);
                    }
                    else
                    {
                        if (_local_8)
                        {
                            _local_8.setWidth(((_local_8.width - _local_12) + _local_11));
                        };
                    };
                }
                else
                {
                    _local_3.setWidth(_arg_2);
                    _local_3.explicitWidth = _arg_2;
                };
            };
            columnsInvalid = true;
            invalidate(InvalidationType.SIZE);
        }

        protected function sortByColumn(_arg_1:int):void
        {
            var _local_2:DataGridColumn = (columns[_arg_1] as DataGridColumn);
            if ((((!(enabled)) || (!(_local_2))) || (!(_local_2.sortable))))
            {
                return;
            };
            var _local_3:Boolean = _local_2.sortDescending;
            var _local_4:uint = _local_2.sortOptions;
            if (_local_3)
            {
                _local_4 = (_local_4 | Array.DESCENDING);
            }
            else
            {
                _local_4 = (_local_4 & (~(Array.DESCENDING)));
            };
            if (_local_2.sortCompareFunction != null)
            {
                sortItems(_local_2.sortCompareFunction, _local_4);
            }
            else
            {
                sortItemsOn(_local_2.dataField, _local_4);
            };
            _sortDescending = (_local_2.sortDescending = (!(_local_3)));
            if (((lastSortIndex >= 0) && (!(lastSortIndex == sortIndex))))
            {
                _local_2 = (columns[lastSortIndex] as DataGridColumn);
                if (_local_2 != null)
                {
                    _local_2.sortDescending = false;
                };
            };
        }

        protected function createColumnsFromDataProvider():void
        {
            var _local_1:Object;
            var _local_2:String;
            _columns = [];
            if (length > 0)
            {
                _local_1 = _dataProvider.getItemAt(0);
                for (_local_2 in _local_1)
                {
                    addColumn(_local_2);
                };
            };
        }

        protected function getVisibleColumnIndex(_arg_1:DataGridColumn):int
        {
            var _local_2:uint;
            while (_local_2 < visibleColumns.length)
            {
                if (_arg_1 == visibleColumns[_local_2])
                {
                    return (_local_2);
                };
                _local_2++;
            };
            return (-1);
        }

        protected function handleHeaderResizeOver(_arg_1:MouseEvent):void
        {
            if (columnStretchIndex == -1)
            {
                showColumnStretchCursor();
            };
        }

        protected function handleHeaderResizeOut(_arg_1:MouseEvent):void
        {
            if (columnStretchIndex == -1)
            {
                showColumnStretchCursor(false);
            };
        }

        protected function handleHeaderResizeDown(_arg_1:MouseEvent):void
        {
            var _local_2:Sprite = (_arg_1.currentTarget as Sprite);
            var _local_3:Number = dragHandlesMap[_local_2];
            var _local_4:DataGridColumn = getColumnAt(_local_3);
            columnStretchIndex = _local_3;
            columnStretchStartX = _arg_1.stageX;
            columnStretchStartWidth = _local_4.width;
            var _local_5:DisplayObjectContainer = focusManager.form;
            _local_5.addEventListener(MouseEvent.MOUSE_MOVE, handleHeaderResizeMove, false, 0, true);
            _local_5.addEventListener(MouseEvent.MOUSE_UP, handleHeaderResizeUp, false, 0, true);
        }

        protected function handleHeaderResizeMove(_arg_1:MouseEvent):void
        {
            var _local_2:Number = (_arg_1.stageX - columnStretchStartX);
            var _local_3:Number = (columnStretchStartWidth + _local_2);
            resizeColumn(columnStretchIndex, _local_3);
        }

        protected function handleHeaderResizeUp(_arg_1:MouseEvent):void
        {
            var _local_4:HeaderRenderer;
            var _local_2:Sprite = (_arg_1.currentTarget as Sprite);
            var _local_3:DataGridColumn = (_columns[columnStretchIndex] as DataGridColumn);
            var _local_5:uint;
            while (_local_5 < header.numChildren)
            {
                _local_4 = (header.getChildAt(_local_5) as HeaderRenderer);
                if (((_local_4) && (_local_4.column == columnStretchIndex))) break;
                _local_5++;
            };
            var _local_6:DataGridEvent = new DataGridEvent(DataGridEvent.COLUMN_STRETCH, false, true, columnStretchIndex, -1, _local_4, ((_local_3) ? _local_3.dataField : null));
            dispatchEvent(_local_6);
            columnStretchIndex = -1;
            showColumnStretchCursor(false);
            var _local_7:DisplayObjectContainer = focusManager.form;
            _local_7.removeEventListener(MouseEvent.MOUSE_MOVE, handleHeaderResizeMove, false);
            _local_7.removeEventListener(MouseEvent.MOUSE_UP, handleHeaderResizeUp, false);
        }

        protected function showColumnStretchCursor(_arg_1:Boolean=true):void
        {
            var _local_3:Point;
            if (columnStretchCursor == null)
            {
                columnStretchCursor = (getDisplayObjectInstance(getStyleValue("columnStretchCursorSkin")) as Sprite);
                columnStretchCursor.mouseEnabled = false;
            };
            var _local_2:DisplayObjectContainer = focusManager.form;
            if (_arg_1)
            {
                Mouse.hide();
                _local_2.addChild(columnStretchCursor);
                _local_2.addEventListener(MouseEvent.MOUSE_MOVE, positionColumnStretchCursor, false, 0, true);
                _local_3 = _local_2.globalToLocal(new Point(stage.mouseX, stage.mouseY));
                columnStretchCursor.x = _local_3.x;
                columnStretchCursor.y = _local_3.y;
            }
            else
            {
                _local_2.removeEventListener(MouseEvent.MOUSE_MOVE, positionColumnStretchCursor, false);
                if (_local_2.contains(columnStretchCursor))
                {
                    _local_2.removeChild(columnStretchCursor);
                };
                Mouse.show();
            };
        }

        protected function positionColumnStretchCursor(_arg_1:MouseEvent):void
        {
            var _local_2:DisplayObjectContainer = focusManager.form;
            var _local_3:Point = _local_2.globalToLocal(new Point(_arg_1.stageX, _arg_1.stageY));
            columnStretchCursor.x = _local_3.x;
            columnStretchCursor.y = _local_3.y;
        }

        protected function setEditedItemPosition(_arg_1:Object):void
        {
            editedItemPositionChanged = true;
            proposedEditedItemPosition = _arg_1;
            if (((_arg_1) && (!(_arg_1.rowIndex == selectedIndex))))
            {
                selectedIndex = _arg_1.rowIndex;
            };
            invalidate(InvalidationType.DATA);
        }

        protected function commitEditedItemPosition(_arg_1:Object):void
        {
            var _local_4:String;
            var _local_5:int;
            if (((!(enabled)) || (!(editable))))
            {
                return;
            };
            if ((((((itemEditorInstance) && (_arg_1)) && (itemEditorInstance is IFocusManagerComponent)) && (_editedItemPosition.rowIndex == _arg_1.rowIndex)) && (_editedItemPosition.columnIndex == _arg_1.columnIndex)))
            {
                IFocusManagerComponent(itemEditorInstance).setFocus();
                return;
            };
            if (itemEditorInstance)
            {
                if ((!(_arg_1)))
                {
                    _local_4 = DataGridEventReason.OTHER;
                }
                else
                {
                    if (((!(editedItemPosition)) || (_arg_1.rowIndex == editedItemPosition.rowIndex)))
                    {
                        _local_4 = DataGridEventReason.NEW_COLUMN;
                    }
                    else
                    {
                        _local_4 = DataGridEventReason.NEW_ROW;
                    };
                };
                if (((!(endEdit(_local_4))) && (!(_local_4 == DataGridEventReason.OTHER))))
                {
                    return;
                };
            };
            _editedItemPosition = _arg_1;
            if ((!(_arg_1)))
            {
                return;
            };
            actualRowIndex = _arg_1.rowIndex;
            actualColIndex = _arg_1.columnIndex;
            if (displayableColumns.length != _columns.length)
            {
                _local_5 = 0;
                while (_local_5 < displayableColumns.length)
                {
                    if (displayableColumns[_local_5].colNum >= actualColIndex)
                    {
                        actualColIndex = displayableColumns[_local_5].colNum;
                        break;
                    };
                    _local_5++;
                };
                if (_local_5 == displayableColumns.length)
                {
                    actualColIndex = 0;
                };
            };
            scrollToPosition(actualRowIndex, actualColIndex);
            var _local_2:ICellRenderer = getCellRendererAt(actualRowIndex, actualColIndex);
            var _local_3:DataGridEvent = new DataGridEvent(DataGridEvent.ITEM_EDIT_BEGIN, false, true, actualColIndex, actualRowIndex, _local_2);
            dispatchEvent(_local_3);
            if (editedItemPositionChanged)
            {
                editedItemPositionChanged = false;
                commitEditedItemPosition(proposedEditedItemPosition);
                proposedEditedItemPosition = undefined;
            };
            if ((!(itemEditorInstance)))
            {
                commitEditedItemPosition(null);
            };
        }

        protected function itemEditorItemEditBeginningHandler(_arg_1:DataGridEvent):void
        {
            if ((!(_arg_1.isDefaultPrevented())))
            {
                setEditedItemPosition({
                    "columnIndex":_arg_1.columnIndex,
                    "rowIndex":uint(_arg_1.rowIndex)
                });
            }
            else
            {
                if ((!(itemEditorInstance)))
                {
                    _editedItemPosition = null;
                    editable = false;
                    setFocus();
                    editable = true;
                };
            };
        }

        protected function itemEditorItemEditBeginHandler(_arg_1:DataGridEvent):void
        {
            var _local_2:IFocusManager;
            addEventListener(Event.DEACTIVATE, deactivateHandler, false, 0, true);
            if ((!(_arg_1.isDefaultPrevented())))
            {
                createItemEditor(_arg_1.columnIndex, uint(_arg_1.rowIndex));
                ICellRenderer(itemEditorInstance).listData = ICellRenderer(editedItemRenderer).listData;
                ICellRenderer(itemEditorInstance).data = editedItemRenderer.data;
                itemEditorInstance.imeMode = ((columns[_arg_1.columnIndex].imeMode == null) ? _imeMode : columns[_arg_1.columnIndex].imeMode);
                _local_2 = focusManager;
                if ((itemEditorInstance is IFocusManagerComponent))
                {
                    _local_2.setFocus(InteractiveObject(itemEditorInstance));
                };
                _local_2.defaultButtonEnabled = false;
                _arg_1 = new DataGridEvent(DataGridEvent.ITEM_FOCUS_IN, false, false, _editedItemPosition.columnIndex, _editedItemPosition.rowIndex, itemEditorInstance);
                dispatchEvent(_arg_1);
            };
        }

        protected function itemEditorItemEditEndHandler(_arg_1:DataGridEvent):void
        {
            var _local_2:Boolean;
            var _local_3:Object;
            var _local_4:String;
            var _local_5:Object;
            var _local_6:String;
            var _local_7:XML;
            var _local_8:IFocusManager;
            if ((!(_arg_1.isDefaultPrevented())))
            {
                _local_2 = false;
                if (((itemEditorInstance) && (!(_arg_1.reason == DataGridEventReason.CANCELLED))))
                {
                    _local_3 = itemEditorInstance[_columns[_arg_1.columnIndex].editorDataField];
                    _local_4 = _columns[_arg_1.columnIndex].dataField;
                    _local_5 = _arg_1.itemRenderer.data;
                    _local_6 = "";
                    for each (_local_7 in describeType(_local_5).variable)
                    {
                        if (_local_4 == _local_7.@name.toString())
                        {
                            _local_6 = _local_7.@type.toString();
                            break;
                        };
                    };
                    switch (_local_6)
                    {
                        case "String":
                            if ((!(_local_3 is String)))
                            {
                                _local_3 = _local_3.toString();
                            };
                            break;
                        case "uint":
                            if ((!(_local_3 is uint)))
                            {
                                _local_3 = uint(_local_3);
                            };
                            break;
                        case "int":
                            if ((!(_local_3 is int)))
                            {
                                _local_3 = int(_local_3);
                            };
                            break;
                        case "Number":
                            if ((!(_local_3 is Number)))
                            {
                                _local_3 = Number(_local_3);
                            };
                            break;
                    };
                    if (_local_5[_local_4] != _local_3)
                    {
                        _local_2 = true;
                        _local_5[_local_4] = _local_3;
                    };
                    _arg_1.itemRenderer.data = _local_5;
                };
            }
            else
            {
                if (_arg_1.reason != DataGridEventReason.OTHER)
                {
                    if (((itemEditorInstance) && (_editedItemPosition)))
                    {
                        if (selectedIndex != _editedItemPosition.rowIndex)
                        {
                            selectedIndex = _editedItemPosition.rowIndex;
                        };
                        _local_8 = focusManager;
                        if ((itemEditorInstance is IFocusManagerComponent))
                        {
                            _local_8.setFocus(InteractiveObject(itemEditorInstance));
                        };
                    };
                };
            };
            if (((_arg_1.reason == DataGridEventReason.OTHER) || (!(_arg_1.isDefaultPrevented()))))
            {
                destroyItemEditor();
            };
        }

        override protected function focusInHandler(_arg_1:FocusEvent):void
        {
            var _local_2:Boolean;
            var _local_3:DataGridColumn;
            if (_arg_1.target != this)
            {
                return;
            };
            if (losingFocus)
            {
                losingFocus = false;
                return;
            };
            setIMEMode(true);
            super.focusInHandler(_arg_1);
            if (((editable) && (!(isPressed))))
            {
                _local_2 = (!(editedItemPosition == null));
                if ((!(_editedItemPosition)))
                {
                    _editedItemPosition = {
                        "rowIndex":0,
                        "columnIndex":0
                    };
                    while (_editedItemPosition.columnIndex < _columns.length)
                    {
                        _local_3 = (_columns[_editedItemPosition.columnIndex] as DataGridColumn);
                        if (((_local_3.editable) && (_local_3.visible)))
                        {
                            _local_2 = true;
                            break;
                        };
                        _editedItemPosition.columnIndex++;
                    };
                };
                if (_local_2)
                {
                    setEditedItemPosition(_editedItemPosition);
                };
            };
            if (editable)
            {
                addEventListener(FocusEvent.KEY_FOCUS_CHANGE, keyFocusChangeHandler);
                addEventListener(MouseEvent.MOUSE_DOWN, mouseFocusChangeHandler);
            };
        }

        override protected function focusOutHandler(_arg_1:FocusEvent):void
        {
            setIMEMode(false);
            if (_arg_1.target == this)
            {
                super.focusOutHandler(_arg_1);
            };
            if (((_arg_1.relatedObject == this) && (itemRendererContains(itemEditorInstance, DisplayObject(_arg_1.target)))))
            {
                return;
            };
            if (((_arg_1.relatedObject == null) && (itemRendererContains(editedItemRenderer, DisplayObject(_arg_1.target)))))
            {
                return;
            };
            if (((_arg_1.relatedObject == null) && (itemRendererContains(itemEditorInstance, DisplayObject(_arg_1.target)))))
            {
                return;
            };
            if (((itemEditorInstance) && ((!(_arg_1.relatedObject)) || (!(itemRendererContains(itemEditorInstance, _arg_1.relatedObject))))))
            {
                endEdit(DataGridEventReason.OTHER);
                removeEventListener(FocusEvent.KEY_FOCUS_CHANGE, keyFocusChangeHandler);
                removeEventListener(MouseEvent.MOUSE_DOWN, mouseFocusChangeHandler);
            };
        }

        protected function editorMouseDownHandler(_arg_1:MouseEvent):void
        {
            var _local_2:ICellRenderer;
            var _local_3:uint;
            if ((!(itemRendererContains(itemEditorInstance, DisplayObject(_arg_1.target)))))
            {
                if (((_arg_1.target is ICellRenderer) && (contains(DisplayObject(_arg_1.target)))))
                {
                    _local_2 = (_arg_1.target as ICellRenderer);
                    _local_3 = _local_2.listData.row;
                    if (_editedItemPosition.rowIndex == _local_3)
                    {
                        endEdit(DataGridEventReason.NEW_COLUMN);
                    }
                    else
                    {
                        endEdit(DataGridEventReason.NEW_ROW);
                    };
                }
                else
                {
                    endEdit(DataGridEventReason.OTHER);
                };
            };
        }

        protected function editorKeyDownHandler(_arg_1:KeyboardEvent):void
        {
            if (_arg_1.keyCode == Keyboard.ESCAPE)
            {
                endEdit(DataGridEventReason.CANCELLED);
            }
            else
            {
                if (((_arg_1.ctrlKey) && (_arg_1.charCode == 46)))
                {
                    endEdit(DataGridEventReason.CANCELLED);
                }
                else
                {
                    if (((_arg_1.charCode == Keyboard.ENTER) && (!(_arg_1.keyCode == 229))))
                    {
                        if (endEdit(DataGridEventReason.NEW_ROW))
                        {
                            findNextEnterItemRenderer(_arg_1);
                        };
                    };
                };
            };
        }

        protected function findNextItemRenderer(_arg_1:Boolean):Boolean
        {
            var _local_7:String;
            var _local_8:DataGridEvent;
            if ((!(_editedItemPosition)))
            {
                return (false);
            };
            if (proposedEditedItemPosition !== undefined)
            {
                return (false);
            };
            var _local_2:int = _editedItemPosition.rowIndex;
            var _local_3:int = _editedItemPosition.columnIndex;
            var _local_4:Boolean;
            var _local_5:int = ((_arg_1) ? -1 : 1);
            var _local_6:int = (length - 1);
            while ((!(_local_4)))
            {
                _local_3 = (_local_3 + _local_5);
                if (((_local_3 < 0) || (_local_3 >= _columns.length)))
                {
                    _local_3 = ((_local_3 < 0) ? (_columns.length - 1) : 0);
                    _local_2 = (_local_2 + _local_5);
                    if (((_local_2 < 0) || (_local_2 > _local_6)))
                    {
                        setEditedItemPosition(null);
                        losingFocus = true;
                        setFocus();
                        return (false);
                    };
                };
                if (((_columns[_local_3].editable) && (_columns[_local_3].visible)))
                {
                    _local_4 = true;
                    if (_local_2 == _editedItemPosition.rowIndex)
                    {
                        _local_7 = DataGridEventReason.NEW_COLUMN;
                    }
                    else
                    {
                        _local_7 = DataGridEventReason.NEW_ROW;
                    };
                    if (((!(itemEditorInstance)) || (endEdit(_local_7))))
                    {
                        _local_8 = new DataGridEvent(DataGridEvent.ITEM_EDIT_BEGINNING, false, true, _local_3, _local_2);
                        _local_8.dataField = _columns[_local_3].dataField;
                        dispatchEvent(_local_8);
                    };
                };
            };
            return (_local_4);
        }

        protected function findNextEnterItemRenderer(_arg_1:KeyboardEvent):void
        {
            if (proposedEditedItemPosition !== undefined)
            {
                return;
            };
            var _local_2:int = _editedItemPosition.rowIndex;
            var _local_3:int = _editedItemPosition.columnIndex;
            var _local_4:int = (_editedItemPosition.rowIndex + ((_arg_1.shiftKey) ? -1 : 1));
            if (((_local_4 >= 0) && (_local_4 < length)))
            {
                _local_2 = _local_4;
            };
            var _local_5:DataGridEvent = new DataGridEvent(DataGridEvent.ITEM_EDIT_BEGINNING, false, true, _local_3, _local_2);
            _local_5.dataField = _columns[_local_3].dataField;
            dispatchEvent(_local_5);
        }

        protected function mouseFocusChangeHandler(_arg_1:MouseEvent):void
        {
            if ((((itemEditorInstance) && (!(_arg_1.isDefaultPrevented()))) && (itemRendererContains(itemEditorInstance, DisplayObject(_arg_1.target)))))
            {
                _arg_1.preventDefault();
            };
        }

        protected function keyFocusChangeHandler(_arg_1:FocusEvent):void
        {
            if ((((_arg_1.keyCode == Keyboard.TAB) && (!(_arg_1.isDefaultPrevented()))) && (findNextItemRenderer(_arg_1.shiftKey))))
            {
                _arg_1.preventDefault();
            };
        }

        private function itemEditorFocusOutHandler(_arg_1:FocusEvent):void
        {
            if (((_arg_1.relatedObject) && (contains(_arg_1.relatedObject))))
            {
                return;
            };
            if ((!(_arg_1.relatedObject)))
            {
                return;
            };
            if (itemEditorInstance)
            {
                endEdit(DataGridEventReason.OTHER);
            };
        }

        protected function deactivateHandler(_arg_1:Event):void
        {
            if (itemEditorInstance)
            {
                endEdit(DataGridEventReason.OTHER);
                losingFocus = true;
                setFocus();
            };
        }

        protected function mouseDownHandler(_arg_1:MouseEvent):void
        {
            if (((!(enabled)) || (!(selectable))))
            {
                return;
            };
            isPressed = true;
        }

        protected function mouseUpHandler(_arg_1:MouseEvent):void
        {
            if (((!(enabled)) || (!(selectable))))
            {
                return;
            };
            isPressed = false;
        }

        override protected function handleCellRendererClick(_arg_1:MouseEvent):void
        {
            var _local_3:DataGridColumn;
            var _local_4:DataGridEvent;
            super.handleCellRendererClick(_arg_1);
            var _local_2:ICellRenderer = (_arg_1.currentTarget as ICellRenderer);
            if ((((_local_2) && (_local_2.data)) && (!(_local_2 == itemEditorInstance))))
            {
                _local_3 = (_columns[_local_2.listData.column] as DataGridColumn);
                if ((((editable) && (_local_3)) && (_local_3.editable)))
                {
                    _local_4 = new DataGridEvent(DataGridEvent.ITEM_EDIT_BEGINNING, false, true, _local_2.listData.column, _local_2.listData.row, _local_2, _local_3.dataField);
                    dispatchEvent(_local_4);
                };
            };
        }

        public function createItemEditor(_arg_1:uint, _arg_2:uint):void
        {
            var _local_6:int;
            if (displayableColumns.length != _columns.length)
            {
                _local_6 = 0;
                while (_local_6 < displayableColumns.length)
                {
                    if (displayableColumns[_local_6].colNum >= _arg_1)
                    {
                        _arg_1 = displayableColumns[_local_6].colNum;
                        break;
                    };
                    _local_6++;
                };
                if (_local_6 == displayableColumns.length)
                {
                    _arg_1 = 0;
                };
            };
            var _local_3:DataGridColumn = (_columns[_arg_1] as DataGridColumn);
            var _local_4:ICellRenderer = getCellRendererAt(_arg_2, _arg_1);
            if ((!(itemEditorInstance)))
            {
                itemEditorInstance = getDisplayObjectInstance(_local_3.itemEditor);
                itemEditorInstance.tabEnabled = false;
                list.addChild(DisplayObject(itemEditorInstance));
            };
            list.setChildIndex(DisplayObject(itemEditorInstance), (list.numChildren - 1));
            var _local_5:Sprite = (_local_4 as Sprite);
            itemEditorInstance.visible = true;
            itemEditorInstance.move(_local_5.x, _local_5.y);
            itemEditorInstance.setSize(_local_3.width, rowHeight);
            itemEditorInstance.drawNow();
            DisplayObject(itemEditorInstance).addEventListener(FocusEvent.FOCUS_OUT, itemEditorFocusOutHandler);
            _local_5.visible = false;
            DisplayObject(itemEditorInstance).addEventListener(KeyboardEvent.KEY_DOWN, editorKeyDownHandler);
            focusManager.form.addEventListener(MouseEvent.MOUSE_DOWN, editorMouseDownHandler, true, 0, true);
        }

        public function destroyItemEditor():void
        {
            var _local_1:DataGridEvent;
            if (itemEditorInstance)
            {
                DisplayObject(itemEditorInstance).removeEventListener(KeyboardEvent.KEY_DOWN, editorKeyDownHandler);
                focusManager.form.removeEventListener(MouseEvent.MOUSE_DOWN, editorMouseDownHandler, true);
                _local_1 = new DataGridEvent(DataGridEvent.ITEM_FOCUS_OUT, false, false, _editedItemPosition.columnIndex, _editedItemPosition.rowIndex, itemEditorInstance);
                dispatchEvent(_local_1);
                if (((itemEditorInstance) && (itemEditorInstance is UIComponent)))
                {
                    UIComponent(itemEditorInstance).drawFocus(false);
                };
                list.removeChild(DisplayObject(itemEditorInstance));
                DisplayObject(editedItemRenderer).visible = true;
                itemEditorInstance = null;
            };
        }

        protected function endEdit(_arg_1:String):Boolean
        {
            if ((!(editedItemRenderer)))
            {
                return (true);
            };
            var _local_2:DataGridEvent = new DataGridEvent(DataGridEvent.ITEM_EDIT_END, false, true, editedItemPosition.columnIndex, editedItemPosition.rowIndex, editedItemRenderer, _columns[editedItemPosition.columnIndex].dataField, _arg_1);
            dispatchEvent(_local_2);
            return (!(_local_2.isDefaultPrevented()));
        }

        public function getCellRendererAt(_arg_1:uint, _arg_2:uint):ICellRenderer
        {
            var _local_4:Array;
            var _local_5:uint;
            var _local_6:ICellRenderer;
            var _local_3:DataGridColumn = (_columns[_arg_2] as DataGridColumn);
            if (_local_3 != null)
            {
                _local_4 = (activeCellRenderersMap[_local_3] as Array);
                if (_local_4 != null)
                {
                    _local_5 = 0;
                    while (_local_5 < _local_4.length)
                    {
                        _local_6 = (_local_4[_local_5] as ICellRenderer);
                        if (_local_6.listData.row == _arg_1)
                        {
                            return (_local_6);
                        };
                        _local_5++;
                    };
                };
            };
            return (null);
        }

        protected function itemRendererContains(_arg_1:Object, _arg_2:DisplayObject):Boolean
        {
            if ((((!(_arg_2)) || (!(_arg_1))) || (!(_arg_1 is DisplayObjectContainer))))
            {
                return (false);
            };
            return (DisplayObjectContainer(_arg_1).contains(_arg_2));
        }

        override protected function handleDataChange(_arg_1:DataChangeEvent):void
        {
            super.handleDataChange(_arg_1);
            if (_columns == null)
            {
                _columns = [];
            };
            if (_columns.length == 0)
            {
                createColumnsFromDataProvider();
            };
        }

        override protected function keyDownHandler(_arg_1:KeyboardEvent):void
        {
            if (((!(selectable)) || (itemEditorInstance)))
            {
                return;
            };
            switch (_arg_1.keyCode)
            {
                case Keyboard.UP:
                case Keyboard.DOWN:
                case Keyboard.END:
                case Keyboard.HOME:
                case Keyboard.PAGE_UP:
                case Keyboard.PAGE_DOWN:
                    moveSelectionVertically(_arg_1.keyCode, ((_arg_1.shiftKey) && (_allowMultipleSelection)), ((_arg_1.ctrlKey) && (_allowMultipleSelection)));
                    break;
                case Keyboard.LEFT:
                case Keyboard.RIGHT:
                    moveSelectionHorizontally(_arg_1.keyCode, ((_arg_1.shiftKey) && (_allowMultipleSelection)), ((_arg_1.ctrlKey) && (_allowMultipleSelection)));
                    break;
                case Keyboard.SPACE:
                    if (caretIndex == -1)
                    {
                        caretIndex = 0;
                    };
                    scrollToIndex(caretIndex);
                    doKeySelection(caretIndex, _arg_1.shiftKey, _arg_1.ctrlKey);
                    break;
            };
            _arg_1.stopPropagation();
        }

        override protected function moveSelectionHorizontally(_arg_1:uint, _arg_2:Boolean, _arg_3:Boolean):void
        {
        }

        override protected function moveSelectionVertically(_arg_1:uint, _arg_2:Boolean, _arg_3:Boolean):void
        {
            var _local_4:int = int(Math.max(Math.floor((calculateAvailableHeight() / rowHeight)), 1));
            var _local_5:int = -1;
            var _local_6:int;
            switch (_arg_1)
            {
                case Keyboard.UP:
                    if (caretIndex > 0)
                    {
                        _local_5 = (caretIndex - 1);
                    };
                    break;
                case Keyboard.DOWN:
                    if (caretIndex < (length - 1))
                    {
                        _local_5 = (caretIndex + 1);
                    };
                    break;
                case Keyboard.PAGE_UP:
                    if (caretIndex > 0)
                    {
                        _local_5 = Math.max((caretIndex - _local_4), 0);
                    };
                    break;
                case Keyboard.PAGE_DOWN:
                    if (caretIndex < (length - 1))
                    {
                        _local_5 = Math.min((caretIndex + _local_4), (length - 1));
                    };
                    break;
                case Keyboard.HOME:
                    if (caretIndex > 0)
                    {
                        _local_5 = 0;
                    };
                    break;
                case Keyboard.END:
                    if (caretIndex < (length - 1))
                    {
                        _local_5 = (length - 1);
                    };
                    break;
            };
            if (_local_5 >= 0)
            {
                doKeySelection(_local_5, _arg_2, _arg_3);
                scrollToSelected();
            };
        }

        override public function scrollToIndex(_arg_1:int):void
        {
            var _local_4:Number;
            drawNow();
            var _local_2:int = int((Math.floor(((_verticalScrollPosition + availableHeight) / rowHeight)) - 1));
            var _local_3:int = int(Math.ceil((_verticalScrollPosition / rowHeight)));
            if (_arg_1 < _local_3)
            {
                verticalScrollPosition = (_arg_1 * rowHeight);
            }
            else
            {
                if (_arg_1 >= _local_2)
                {
                    _local_4 = (((_horizontalScrollPolicy == ScrollPolicy.ON) || ((_horizontalScrollPolicy == ScrollPolicy.AUTO) && (hScrollBar))) ? 15 : 0);
                    verticalScrollPosition = (((((_arg_1 + 1) * rowHeight) - availableHeight) + _local_4) + ((showHeaders) ? headerHeight : 0));
                };
            };
        }

        protected function scrollToPosition(_arg_1:int, _arg_2:int):void
        {
            var _local_5:uint;
            var _local_8:DataGridColumn;
            var _local_3:Number = verticalScrollPosition;
            var _local_4:Number = horizontalScrollPosition;
            scrollToIndex(_arg_1);
            var _local_6:Number = 0;
            var _local_7:DataGridColumn = (_columns[_arg_2] as DataGridColumn);
            _local_5 = 0;
            while (_local_5 < displayableColumns.length)
            {
                _local_8 = (displayableColumns[_local_5] as DataGridColumn);
                if (_local_8 != _local_7)
                {
                    _local_6 = (_local_6 + _local_8.width);
                }
                else
                {
                    break;
                };
                _local_5++;
            };
            if (horizontalScrollPosition > _local_6)
            {
                horizontalScrollPosition = _local_6;
            }
            else
            {
                if ((horizontalScrollPosition + availableWidth) < (_local_6 + _local_7.width))
                {
                    horizontalScrollPosition = -(availableWidth - (_local_6 + _local_7.width));
                };
            };
            if (((!(_local_3 == verticalScrollPosition)) || (!(_local_4 == horizontalScrollPosition))))
            {
                drawNow();
            };
        }

        protected function doKeySelection(_arg_1:int, _arg_2:Boolean, _arg_3:Boolean):void
        {
            var _local_5:int;
            var _local_6:Array;
            var _local_7:int;
            var _local_8:int;
            var _local_4:Boolean;
            if (_arg_2)
            {
                _local_6 = [];
                _local_7 = lastCaretIndex;
                _local_8 = _arg_1;
                if (_local_7 == -1)
                {
                    _local_7 = ((!(caretIndex == -1)) ? caretIndex : _arg_1);
                };
                if (_local_7 > _local_8)
                {
                    _local_8 = _local_7;
                    _local_7 = _arg_1;
                };
                _local_5 = _local_7;
                while (_local_5 <= _local_8)
                {
                    _local_6.push(_local_5);
                    _local_5++;
                };
                selectedIndices = _local_6;
                caretIndex = _arg_1;
                _local_4 = true;
            }
            else
            {
                if (_arg_3)
                {
                    caretIndex = _arg_1;
                }
                else
                {
                    selectedIndex = _arg_1;
                    caretIndex = (lastCaretIndex = _arg_1);
                    _local_4 = true;
                };
            };
            if (_local_4)
            {
                dispatchEvent(new Event(Event.CHANGE));
            };
            invalidate(InvalidationType.DATA);
        }

        override protected function initializeAccessibility():void
        {
            if (DataGrid.createAccessibilityImplementation != null)
            {
                DataGrid.createAccessibilityImplementation(this);
            };
        }


    }
}//package fl.controls