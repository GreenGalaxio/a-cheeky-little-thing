// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_airkickforward_special_90

package mario_fla
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

    public dynamic class mario_airkickforward_special_90 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hand:MovieClip;
        public var self:*;

        public function mario_airkickforward_special_90()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 9, this.frame10, 18, this.frame19);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame4():*
        {
            this.self.modifyAttackPower(45);
            this.self.modifyAttackDirection(45);
            this.self.modifyAttackDamage(10);
        }

        internal function frame10():*
        {
            this.self.modifyAirCancel(true);
            this.self.modifyAirCancelSpecial(true);
        }

        internal function frame19():*
        {
            this.self.endAttack();
        }


    }
}//package mario_fla

