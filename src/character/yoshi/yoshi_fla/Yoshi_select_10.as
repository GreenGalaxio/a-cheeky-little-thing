// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//yoshi_fla.Yoshi_select_10

package yoshi_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class Yoshi_select_10 extends MovieClip 
    {

        public var self:*;

        public function Yoshi_select_10()
        {
            addFrameScript(0, this.frame1, 38, this.frame39);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame39():*
        {
            this.gotoAndPlay("loop");
        }


    }
}//package yoshi_fla

