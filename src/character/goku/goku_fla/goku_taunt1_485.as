// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.goku_taunt1_485

package goku_fla
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

    public dynamic class goku_taunt1_485 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox10:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox7:MovieClip;
        public var hitBox8:MovieClip;
        public var hitBox9:MovieClip;
        public var self:*;

        public function goku_taunt1_485()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 16, this.frame17, 18, this.frame19, 40, this.frame41, 49, this.frame50, 66, this.frame67);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame2():*
        {
            SSF2API.playSound("gokuhehehtaunt");
        }

        internal function frame17():*
        {
            this.self.endAttack();
        }

        internal function frame19():*
        {
            SSF2API.playSound("goku_dSpec");
        }

        internal function frame41():*
        {
            this.self.endAttack();
        }

        internal function frame50():*
        {
            SSF2API.playSound("KK_Goku_vocal_new");
        }

        internal function frame67():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

