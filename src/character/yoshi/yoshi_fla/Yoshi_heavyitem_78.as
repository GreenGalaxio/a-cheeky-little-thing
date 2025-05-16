// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//yoshi_fla.Yoshi_heavyitem_78

package yoshi_fla
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

    public dynamic class Yoshi_heavyitem_78 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var ready:Boolean;
        public var tossitem:Boolean;

        public function Yoshi_heavyitem_78()
        {
            addFrameScript(0, this.frame1, 19, this.frame20, 21, this.frame22, 31, this.frame32, 33, this.frame34, 40, this.frame41);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.ready = false;
                this.tossitem = false;
            };
        }

        internal function frame20():*
        {
            this.ready = true;
        }

        internal function frame22():*
        {
            gotoAndPlay("idel");
        }

        internal function frame32():*
        {
            gotoAndPlay("idel");
        }

        internal function frame34():*
        {
            this.tossitem = true;
        }

        internal function frame41():*
        {
            this.self.endAttack();
        }


    }
}//package yoshi_fla

