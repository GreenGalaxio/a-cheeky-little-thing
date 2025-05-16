// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.Bomberman_walk_14

package bomberman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class Bomberman_walk_14 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function Bomberman_walk_14()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 21, this.frame22);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame7():*
        {
            SSF2API.playSound("bomberman_step1");
        }

        internal function frame22():*
        {
            SSF2API.playSound("bomberman_step2");
        }


    }
}//package bomberman_fla

