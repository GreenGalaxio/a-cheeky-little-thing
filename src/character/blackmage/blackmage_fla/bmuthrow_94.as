// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmuthrow_94

package blackmage_fla
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

    public dynamic class bmuthrow_94 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function bmuthrow_94()
        {
            addFrameScript(0, this.frame1, 18, this.frame19, 20, this.frame21, 23, this.frame24, 26, this.frame27, 29, this.frame30, 32, this.frame33, 34, this.frame35, 35, this.frame36, 41, this.frame42);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            this.xframe = null;
        }

        internal function frame19():*
        {
            this.xframe = "attack";
        }

        internal function frame21():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame24():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame27():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame30():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame33():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame35():*
        {
            this.self.updateAttackStats({"refreshRate":20});
            this.self.updateAttackBoxStats(1, {
                "damage":4,
                "power":63,
                "direction":95,
                "hasEffect":true,
                "weightKB":0,
                "kbConstant":85
            });
            this.self.refreshAttackID();
        }

        internal function frame36():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame42():*
        {
            this.self.endAttack();
        }


    }
}//package blackmage_fla

