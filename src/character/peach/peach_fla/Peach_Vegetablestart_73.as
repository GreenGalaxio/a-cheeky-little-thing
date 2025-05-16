// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.Peach_Vegetablestart_73

package peach_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.globalization.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class Peach_Vegetablestart_73 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var randomTurnip:String;
        public var turnips:Array;
        public var item:Array;
        public var randomItem:String;
        public var i:Number;

        public function Peach_Vegetablestart_73()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 7, this.frame8, 11, this.frame12);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                if (this.self.getItem() == null)
                {
                    this.randomTurnip = "";
                    this.turnips = new Array();
                    this.item = new Array();
                    this.randomItem = "";
                    this.i = 1;
                    while (this.i <= 18)
                    {
                        this.turnips.push("smile");
                        this.i++;
                    };
                    this.i = 1;
                    while (this.i <= 17)
                    {
                        this.turnips.push("eh");
                        this.i++;
                    };
                    this.i = 1;
                    while (this.i <= 17)
                    {
                        this.turnips.push("happy");
                        this.i++;
                    };
                    this.i = 1;
                    while (this.i <= 10)
                    {
                        this.turnips.push("whatever");
                        this.i++;
                    };
                    this.i = 1;
                    while (this.i <= 10)
                    {
                        this.turnips.push("crying");
                        this.i++;
                    };
                    this.i = 1;
                    while (this.i <= 11)
                    {
                        this.turnips.push("angry");
                        this.i++;
                    };
                    this.i = 1;
                    while (this.i <= 11)
                    {
                        this.turnips.push("shock");
                        this.i++;
                    };
                    this.i = 1;
                    while (this.i <= 2)
                    {
                        this.turnips.push("item");
                        this.i++;
                    };
                    this.i = 1;
                    while (this.i <= 2)
                    {
                        this.turnips.push("kissy");
                        this.i++;
                    };
                    this.randomTurnip = this.turnips[Math.round((SSF2API.random() * (this.turnips.length - 1)))];
                    this.self.setAttackEnabled(false, "b_down");
                }
                else
                {
                    this.self.endAttack();
                };
            };
        }

        internal function frame5():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame8():*
        {
            if (this.randomTurnip != "item")
            {
                this.self.generateItem(this.randomTurnip, true, true);
            };
            if (this.randomTurnip == "item")
            {
                this.item.push("beamsword");
                this.item.push("bobomb");
                this.item.push("mrsaturn");
                this.item.push("stitch");
                this.item.push("ODDISH");
                this.item.push("cucco");
                this.item.push("capsule");
                this.randomItem = this.item[Math.round((SSF2API.random() * (this.item.length - 1)))];
                if (this.randomItem == "stitch")
                {
                    this.self.generateItem(this.randomItem, true, true);
                }
                else
                {
                    if (this.randomItem == "ODDISH")
                    {
                        this.self.generateItem(this.randomItem, true, true);
                        SSF2API.playSound("oddishsfx");
                    }
                    else
                    {
                        this.self.generateItem(this.randomItem, true, false);
                    };
                };
            };
        }

        internal function frame12():*
        {
            this.self.endAttack();
        }


    }
}//package peach_fla

